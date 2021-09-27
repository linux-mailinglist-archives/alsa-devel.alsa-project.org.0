Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61465419178
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 11:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26171660;
	Mon, 27 Sep 2021 11:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26171660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632734625;
	bh=l8W//lCUtPWZD9E4V10R5JnMtvDYBxPjBtzlpUamgek=;
	h=From:Subject:Date:In-Reply-To:To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DkWh8Hh4pWnCa1cbZYLwPMkIRQ7OxJqCOUzrsRus8wRXN5ydtUc+7SsQNqbv8mLtf
	 Q8+bFuhv31szYUJn0E/xuwncEB96QaNviAQUl6xF4ohTiiohy4+IuQVFSBPv9u5EHG
	 rMALNfp7/SnOpjfEWm0XLcT4fFcU1ik749wS8QD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B2AF8026D;
	Mon, 27 Sep 2021 11:22:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECF9CF80227; Mon, 27 Sep 2021 11:22:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out002.mailprotect.be (out002.mailprotect.be [83.217.72.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F76BF80161
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 11:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F76BF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailprotect.be header.i=@mailprotect.be
 header.b="B8S8sqM/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mailprotect.be; s=mail; h=References:To:Cc:In-Reply-To:Date:Subject:
 Mime-Version:Content-Type:Message-Id:From:reply-to:sender:bcc:
 content-transfer-encoding; bh=QWCeWuHXScWo/lXqVaBjHaZ8hUCLXf+H+BeSk0R+e08=;
 b=B8S8sqM/ND6ZBLb5CEO3fYh6Ulx5mCZLtnnjmQzpeUP/N/OOYmpllgawTWRTZpQNbzStR0h9Qy
 cDy6ohNaOym+szPKC6kIOJUeKMRY3sECPfQyRydlxT2v567v+kEq+L83o5V3FBQx6NFpm+8f+1HW3
 mlLwOuec59osNYDVtwykrPWV5m0oJvMkhTC5a1OJKSNxZzNBYOpYs7Bu2oPOHUjDqJV7/BHAllkhk
 YOPPTInwiBtpBhU46PXabDa+G+8ODFV5eQcZbUOoVaKAHQSOBSVovCaWJaNPrpsV1JiGvXhgmIfwj
 P+31ejMU/E2bh7ddUP8hN15XeVPbP1JZYHIwQ==;
Received: from smtp-auth.mailprotect.be ([178.208.39.159])
 by com-mpt-out002.mailprotect.be with esmtp (Exim 4.92)
 (envelope-from <linux@panokkel.be>)
 id 1mUmpw-0000pJ-3I; Mon, 27 Sep 2021 11:22:18 +0200
Received: from [192.168.1.10] (202.17-200-80.adsl-dyn.isp.belgacom.be
 [80.200.17.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-auth.mailprotect.be (Postfix) with ESMTPSA id BD099C0215;
 Mon, 27 Sep 2021 11:21:35 +0200 (CEST)
From: Philippe Bekaert <linux@panokkel.be>
Message-Id: <11502B6C-870C-4BC1-BE44-78971E548ABD@panokkel.be>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Broken Pipe with SNDRV_PCM_IOCTL_WRITEI_FRAMES
Date: Mon, 27 Sep 2021 11:21:35 +0200
In-Reply-To: <_PhylB5sSzE44xsNHmeiM9rZHJxEiTmQ2UUuR6UgmpgyLolZQDzgQlPWNvRezAViAVXF-qKegbkLhhMVMMGD1mKQSs-FqjrF1uhMQ5SliVE=@protonmail.com>
To: Ryan McClue <re.mcclue@protonmail.com>
References: <aMjqrUVYYlPC6M_ZW7GlV0WUwUzJimDuTXi2mWq62PH9GbMUmTMK0ECdR837FlWMPQd8sP57TNh3Coq19l0gm75NBOh7oqPGpl7ARwjF-u0=@protonmail.com>
 <_PhylB5sSzE44xsNHmeiM9rZHJxEiTmQ2UUuR6UgmpgyLolZQDzgQlPWNvRezAViAVXF-qKegbkLhhMVMMGD1mKQSs-FqjrF1uhMQ5SliVE=@protonmail.com>
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: 178.208.39.159
X-SpamExperts-Domain: mailprotect.be
X-SpamExperts-Username: 178.208.39.128/27
Authentication-Results: mailprotect.be;
 auth=pass smtp.auth=178.208.39.128/27@mailprotect.be
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.17)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8qlHHTezUs9qJfzYC5njIePUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ynOqv5wVH0VS/etXvrFNNzaJlM0GUlwLkcZrRacppWhS1N
 v6tU2CJ6/qBoil7WIh5+NCbTf7ivZocP1hpab1oOQaXPwIlI4yu/PH1NWDdGRZkABhimVE9DSwi/
 ljG7tt9TtObPqIqeRAv2CqzEPfjvnMSYJk6B11STQ6mPwB3L575XMmksNo/CYcBpHSsW1w7fMQuf
 H/LtR4V8k0auMQAbmC/9mJUG+6OxwpRnt0PE8FA0hlu/NpOnaXNvrIp4mRFXM1A/yPl6iMWcd7+6
 /vdSy3hAYeHzPgnCe01lwQ05PIH9dd5mWFG11aWrXb4haDCZB7Q1HjVD0Ab7r04HqHAHWhEJF/sB
 EmKe9xQ0JSABEx5U+J5LDqVPT09KhVKtIbxpxuRFhdm3QT0+djE9iHZzqhDUwCSxYm00/sHWHuFD
 v5E3duSpl3s+9JzXSKJpDvDlgTl6fJxyntEfhZCKje4ZOalOzZlmOelDRCo/4ULra7I0q854skGD
 r1SFWz9TrEYPV7vqzOxa8GxpL4pWK6wGDhN9Lay79vLKZK6pPLGn9kTEPJGKKhCa8ZOt7fuZaHRy
 EYUeNDqrX3Sju+Zod+Vz2EDnl9hkGNb1S6u0sMVtunA44DKI9LN9kgJupKIP0FEJiJ0LEYtgU9LE
 lMSL5ELYrbCCY9moJ2wkN48k7yOyRgl8A6hZaZnthbyj6fR51qOpoBQ5kqcsRzrivTp5krNGoGWQ
 EvZuWQCoNahq3mTnRbYGZHEZAp6DM6bNcPGZcloG9qFQ2LfyHgizzt5i4nVPU4rLu8PYG2iyMwXk
 vimqCLTRBA0jOuTxfpzmwSCVQpJRXxKF5tPxTxfD0dMN+t5ZhIDByWFl4e/4SIW0u4RA7wczHvSI
 5QqQfCyF8o+EMRLzjMPb2j+Z5+b5Y+K9AkjDUL8tt0mV0nzGe0cxxh9ZdiWxdrU9SC3QAPY60TeB
 yCPBGd/c8ke2/GfAOOV+GNu87sn//RcLEIwmfxtejjVQPSYZNyQkxem9Bz+CTwuhhSIDd0WgOe5Q
 5yO62l+AMVMERj8Lx3hwF6U48aFew68O9g==
X-Report-Abuse-To: spam@com-mpt-mgt001.mailprotect.be
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Ryan,

I realize this is probably not the answer you are waiting and hoping =
for, but why do you use the ioctl interface directly in the first place?
People on this list will likely be more alarmed if you had problems with =
audio I/O, when done as explained on
https://www.alsa-project.org/alsa-doc/alsa-lib/pcm.html =
<https://www.alsa-project.org/alsa-doc/alsa-lib/pcm.html>
and illustrated in the examples.

Best,

Philippe.


> On 27 Sep 2021, at 01:21, Ryan McClue <re.mcclue@protonmail.com> =
wrote:
>=20
> I've update my loop to:
>=20
> struct
>=20
> snd_xferi
>=20
> transfer
>=20
> =3D
>=20
> {};
>  transfer.buf =3D (u8 *)buffer;
>  transfer.frames =3D num_base_samples;
>=20
> int
>=20
> res =3D ioctl(fd, SNDRV_PCM_IOCTL_WRITEI_FRAMES, &transfer);
>=20
> if
>=20
> (res =3D=3D -EPIPE) {
>    ioctl(fd, SNDRV_PCM_IOCTL_PREPARE);
>=20
> This removes the Broken Pipe, however no sound is heard.
> --
> Ryan McClue, Sydney
>=20
> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 =
Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=
=80=90
> On Sunday, September 26th, 2021 at 7:01 PM, Ryan McClue =
<re.mcclue@protonmail.com> wrote:
>=20
>> Hello again.
>> I'm using alsa-kernel.
>> My configuration:
>> SNDRV_PCM_HW_PARAM_ACCESS =3D SNDRV_PCM_ACCESS_RW_INTERLEAVED
>> SNDRV_PCM_HW_PARAM_FORMAT =3D SNDRV_PCM_FORMAT_S16_LE
>> SNDRV_PCM_HW_PARAM_SUBFORMAT =3D SNDRV_PCM_SUBFORMAT_STD
>> SNDRV_PCM_HW_PARAM_CHANNELS =3D 2
>> SNDRV_PCM_HW_PARAM_RATE =3D 48000
>>=20
>> I have a vsynced game loop that is running at 60fps:
>>=20
>>> int num_base_samples =3D 48000 * (1 / 60);
>>> int num_samples =3D  num_base_samples * 2;
>>> int16_t buffer[num_samples] =3D {};
>>>=20
>>> while (true) {
>>>  int16_t *samples =3D buffer;
>>>  for (int sample_i =3D 0; sample_i < num_base_samples; sample_i++) {
>>>    *samples++ =3D 0x33;
>>>    *samples++ =3D 0x33;
>>>  }
>>>=20
>>>  struct snd_xferi transfer =3D {};
>>>  transfer.buf =3D buffer;
>>>  transfer.frames =3D num_base_samples;
>>>  ioctl(fd, SNDRV_PCM_IOCTL_WRITEI_FRAMES, &transfer);
>>>=20
>>>  // ioctl(fd, SNDRV_PCM_IOCTL_DRAIN);  --> NECESSARY???
>>>  // ioctl(fd, SNDRV_PCM_IOCTL_PREPARE);  --> NECESSARY???
>>> }
>>=20
>> On the first iteration of SNDRV_PCM_IOCTL_WRITEI_FRAMES I get no =
error.
>> All subsequent iterations, I get Broken Pipe error.
>> So, to counteract this at the end of each frame I call =
SNDRV_PCM_IOCTL_DRAIN and SNDRV_PCM_IOCTL_PREPARE.
>> This removes the Broken Pipe error however slows the program down by =
half and no sound is heard.
>> How best to solve this issue?
>>=20
>> Thanks again
>> --
>> Ryan McClue, Sydney

