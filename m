Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2AE23B7C7
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 11:34:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA331669;
	Tue,  4 Aug 2020 11:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA331669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596533642;
	bh=ayYg5PrVtbU7sG7wqTbOFhne04r4ra6uA4FfddFjGjA=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fN0jiDJOvDRyvlcS44zMFeb4Kmbxn/DrT5JfSqirltt+ugkYy5T5BcttuflRufVOW
	 OOvvel1xm8Cxqh7+SIvkC0Hvrn49jcVqF0Qd5I/t91DdmQbYu258Yp6PC5xGrcMWoM
	 Xiep8SmYlrLzVjPZI+PKQgNdvIsOEQGxLokvZswU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87AE0F80148;
	Tue,  4 Aug 2020 11:32:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18907F80150; Tue,  4 Aug 2020 11:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0D91F80148
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 11:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0D91F80148
Received: from mail-pj1-f70.google.com ([209.85.216.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1k2tIj-0003hv-Oq
 for alsa-devel@alsa-project.org; Tue, 04 Aug 2020 09:32:05 +0000
Received: by mail-pj1-f70.google.com with SMTP id lx6so1786615pjb.9
 for <alsa-devel@alsa-project.org>; Tue, 04 Aug 2020 02:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=m7D3E+oljZppcXRqnOA0d+1JsK0dAh8esFkhEip7S3c=;
 b=U77Y1g+8XOuBJmzyrjvyaEO7yvNMS+Av66fT1ZMdeylTDpWnyJtFXGUcnSusWFuuWD
 s7I6mrKoMvkTdFa951D31Ys1SnFbvHi0Oq14vBufMyJKCFsdb3EqVY9+9rwr4yHBAjBV
 tE+0gf7WTgD0ZJUTBuGFZAkzLsegl+RNDB6wEgWnr0H2sMeQFZ8pwK52lIOSqNlMmG6w
 v5rwc6JkCEUCymDG4ev2SQAkWBv2ymqkLLFEj7tBQE4bdvtDWN0is/Z9hwoal+HfXh93
 BjGkTjG1VuBApkMOaK9E5Zw95iLE3516cdPOzDTM8OwqFcf98XPmjmBpsKNybIYZWg41
 0jyQ==
X-Gm-Message-State: AOAM530DGHiR0/mrSJbxTKJIroj/Vjp6HF1sJ+sLyCzbc/2D/y4K4MoU
 ZN6wWi6aqbRo16KBqB8eVxyjb24wGJflCq0a/n3vFesc4HVEGLEo9T3S7CISzzK1kHxHkRULBDL
 FWN7UwzufWNy4QTlpSAViHs9KtFOJCx3vJ0eFC+Eq
X-Received: by 2002:a62:6491:: with SMTP id
 y139mr19387371pfb.102.1596533524379; 
 Tue, 04 Aug 2020 02:32:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyChQbl3Sq1PVoc/sQokj4EO+tLCMI48/uyJjuiqnk70WW4RrmMYu1sGVfmrT+s694MpWx8dA==
X-Received: by 2002:a62:6491:: with SMTP id
 y139mr19387332pfb.102.1596533523824; 
 Tue, 04 Aug 2020 02:32:03 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id 22sm21501192pfh.157.2020.08.04.02.32.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 02:32:03 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] ALSA: hda/hdmi: Add pins with jack detection support
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hv9hy235r.wl-tiwai@suse.de>
Date: Tue, 4 Aug 2020 17:31:59 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <41E2234E-451C-4C14-833A-E24C650EDEE1@canonical.com>
References: <20200804072926.16897-1-kai.heng.feng@canonical.com>
 <s5hv9hy235r.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Aaron Plattner <aplattner@nvidia.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com
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



> On Aug 4, 2020, at 17:04, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Tue, 04 Aug 2020 09:29:25 +0200,
> Kai-Heng Feng wrote:
>>=20
>> HDMI on some platforms doesn't enable audio support because its Port
>> Connectivity [31:30] is set to AC_JACK_PORT_NONE:
>> Node 0x05 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
>>  Amp-Out caps: ofs=3D0x00, nsteps=3D0x00, stepsize=3D0x00, mute=3D1
>>  Amp-Out vals:  [0x00 0x00]
>>  Pincap 0x0b000094: OUT Detect HBR HDMI DP
>>  Pin Default 0x58560010: [N/A] Digital Out at Int HDMI
>>    Conn =3D Digital, Color =3D Unknown
>>    DefAssociation =3D 0x1, Sequence =3D 0x0
>>  Pin-ctls: 0x40: OUT
>>  Unsolicited: tag=3D00, enabled=3D0
>>  Power states:  D0 D3 EPSS
>>  Power: setting=3DD0, actual=3DD0
>>  Devices: 0
>>  Connection: 3
>>     0x02 0x03* 0x04
>>=20
>> Those pins were filtered out by commit 116dcde63806 ("ALSA: HDA: =
Remove
>> unconnected PCM devices for Intel HDMI"). However, jacks that support
>> detection won't have the issues the commit addresses.
>>=20
>> So still add the pin if it supports jack detection.
>>=20
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>=20
> Which platform did show the problem?

An HP desktop.

>=20
> I'm reluctant to apply this change as it would potentially break the
> existing system.  If we must to apply, maybe it's safer to apply it
> conditionally to the limited devices.

Hmm, I find it's a bit hard to match a specific device, because the ID =
seems to be rather generic:
Codec: Intel Kabylake HDMI
Address: 2                     =20
AFG Function Id: 0x1 (unsol 0)
Vendor Id: 0x8086280b        =20
Subsystem Id: 0x80860101
Revision Id: 0x100000

Should we use DMI string instead?

Kai-Heng

>=20
>=20
> thanks,
>=20
> Takashi
>=20
>> ---
>> sound/pci/hda/patch_hdmi.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
>> index cd46247988e4..db3a5148bd40 100644
>> --- a/sound/pci/hda/patch_hdmi.c
>> +++ b/sound/pci/hda/patch_hdmi.c
>> @@ -1701,7 +1701,8 @@ static int hdmi_add_pin(struct hda_codec =
*codec, hda_nid_t pin_nid)
>> 	 * all device entries on the same pin
>> 	 */
>> 	config =3D snd_hda_codec_get_pincfg(codec, pin_nid);
>> -	if (get_defcfg_connect(config) =3D=3D AC_JACK_PORT_NONE)
>> +	if ((get_defcfg_connect(config) =3D=3D AC_JACK_PORT_NONE) &&
>> +	    !(caps & AC_PINCAP_PRES_DETECT))
>> 		return 0;
>>=20
>> 	/*
>> --=20
>> 2.17.1

