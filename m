Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A0519D1A0
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 10:03:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8A081686;
	Fri,  3 Apr 2020 10:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8A081686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585900982;
	bh=f6aBFhaK/VwvUALsmnmoRJuqc2+Lb+f+HEOjzaHNNSE=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f05cNNTIWJgv+VeqEgXqZDzAgtHD6mYZc+TVIFfDw218cDqa4sQo8cCmx4fOWPuuy
	 XzEFpXVC+YbJvmsy4goE6zu3lE77PP8CvSZPigCfgAnMBdunG/fbMAkNFGtDiN1SbA
	 n3txgGW7q636MkVyaVsbcitG0+uzg4bbm7EO6MOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E196BF800C2;
	Fri,  3 Apr 2020 10:01:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 190AFF8014C; Fri,  3 Apr 2020 10:01:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 177DFF800C2
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 10:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 177DFF800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="QhIWt3lF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585900873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6aBFhaK/VwvUALsmnmoRJuqc2+Lb+f+HEOjzaHNNSE=;
 b=QhIWt3lFjDWvO1GyLYuqab8rbcQiz9wBdiL7/hzZVkQ1fnzZ3Y6ZwwsGsayLmBKoVQKFrV
 G+hVRSr/Hpq/MURDz7dncd/mJPigsFXgw2ix9HFHQXNtvlsgILt0bFw/qVOFkhMSVj3A+Z
 G8i3w6RLFCO8MN7qWbmuxqnKgEfK9sU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-NDCL5z4vOZWwEZq6Cpgeaw-1; Fri, 03 Apr 2020 04:01:10 -0400
X-MC-Unique: NDCL5z4vOZWwEZq6Cpgeaw-1
Received: by mail-wr1-f69.google.com with SMTP id v14so2693955wrq.13
 for <alsa-devel@alsa-project.org>; Fri, 03 Apr 2020 01:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kNBMssSj0+XRlE6QYNkKz7rOdqNuhUURKMH2z+oyxjE=;
 b=KEAZ//26GFDmh13GjYeKG60CaM9KLUwt8/Q0qAMy6/Rg8J2isF7ZqQ/VgfaRpq41BD
 rMPHCOtth7g7vLdRovAqDConYtWcQICZo8FGtufFEeih7o/j7T7ZVDMFFs2+lc1lNT2J
 rSJTHIKOQU4OZgBUPi0sIum2wcmkQJ8xxmNNAuCSkYTlMAcbz5Ygiq1TxlggZ6oeHzQ9
 nXrmFK/MvSLXP8sHhktKsUoKLvsJnU569rz2n2K+/AzCEJDJHDTdveFYgc4ywmT7mi9a
 0JwfLuRx5Ho6yjNojBqu5joUfIxVimbuTFQVRiUBuYdr5jSmW+OgQ3xefCmr//DeoirL
 9z1Q==
X-Gm-Message-State: AGi0Pubd38PSPi72CVcmgpLstrKM07p0bwF+MucXgdr/EwEo12ACyzrf
 VCRKfcxEBYG/xVU882g6OW3KWwbSOFAS0XNFK9dcNmS+F89Z27G7QBerpaHL8bqUGLSTyntCZzJ
 h7Cpvf3duuaKm/Im6Qx/OJ8U=
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr7517831wmj.180.1585900869001; 
 Fri, 03 Apr 2020 01:01:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypJTajfi8ZZ8BPG2wQcyUqF7XdbRpfXBCNlAdQjuTT/pP7FrUY15/9ivTuWVIoBjw1SiSm5cvA==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr7517804wmj.180.1585900868714; 
 Fri, 03 Apr 2020 01:01:08 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id z203sm10609566wmg.12.2020.04.03.01.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 01:01:07 -0700 (PDT)
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Fix "no reply expected" error during
 firmware-boot
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20200402184948.3014-1-hdegoede@redhat.com>
 <1ecf6c31-4eb1-0288-2353-7a7a421fe5e7@linux.intel.com>
Message-ID: <a0d5d95e-113b-3543-cfc5-43dfa3f9142c@redhat.com>
Date: Fri, 3 Apr 2020 10:01:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1ecf6c31-4eb1-0288-2353-7a7a421fe5e7@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org
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

Hi,

On 4/2/20 9:15 PM, Pierre-Louis Bossart wrote:
>=20
>=20
> On 4/2/20 1:49 PM, Hans de Goede wrote:
>> At least on Canon Lake each time the SOF firmware is booted,
>> the following error is logged in dmesg:
>>
>> [=C2=A0=C2=A0 36.711803] sof-audio-pci 0000:00:1f.3: error: no reply exp=
ected, received 0x0
>>
>> Since the DSP is powered down when not in used this happens everytime
>> e.g. a notification plays, polluting dmesg with these false-positive
>> errors.
>=20
> What kernel are you using Hans? I thought this was solved with

5.6.0

> 8354d9b44530b ("ASoC: SOF: Intel: hda-loader: clear the IPC ack bit after=
 FW_PURGE done") >
> Set DONE bit after the FW_PURGE IPC is polled successfully, to clear the
> interrupt and avoid the arrival of the confusing unexpected ipc.

That commit is not in Torvald's tree yet, but it is in
broonie/sound.git, I've cherry picked it into my local tree
and reverted my own fix.

Unfortunately even with that patch cherry picked the errors my
patch silences still happen.

Regards,

Hans



>> Add a check to snd_sof_ipc_reply() which makes it return success when
>> receiving an unexpected msg_id 0 during fw-boot, fixing these
>> false-positive errors being logged.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> =C2=A0 sound/soc/sof/ipc.c | 5 +++++
>> =C2=A0 1 file changed, 5 insertions(+)
>>
>> diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
>> index 78aa1da7c7a9..7303b3d42f12 100644
>> --- a/sound/soc/sof/ipc.c
>> +++ b/sound/soc/sof/ipc.c
>> @@ -312,6 +312,11 @@ int snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32=
 msg_id)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_sof_ipc_msg *msg =3D &sdev->ip=
c->msg;
>> +=C2=A0=C2=A0=C2=A0 /* Ignore msg_id 0 being send during fw-boot */
>> +=C2=A0=C2=A0=C2=A0 if (msg->ipc_complete && sdev->fw_state =3D=3D SOF_F=
W_BOOT_IN_PROGRESS &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg_id =3D=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (msg->ipc_complete) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(sdev->dev=
, "error: no reply expected, received 0x%x",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 msg_id);
>>
>=20

