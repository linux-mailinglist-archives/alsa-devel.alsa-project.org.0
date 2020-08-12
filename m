Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A235242D82
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 18:41:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 166B7166D;
	Wed, 12 Aug 2020 18:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 166B7166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597250474;
	bh=qu/0wH3u3RAimZCQbqL6DgAdbEKz7BJ8/YGq/QLFClY=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TbBv06o9rM6Oet5T1A3W/bULa60x3R+JsLca7jbz9WReN4m6Qg+vfn/sIGCpdlVQU
	 mO6lKzXsZ8tczV5No9liMOaRPNdnvf1KD1NOXKlLFru0ZLseGKmveNiLN2PCy9kKa/
	 TWXA4eFla2HPz0On/0M9f/pozWUaBMn54vRmew8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D176F800F4;
	Wed, 12 Aug 2020 18:40:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB012F80245; Wed, 12 Aug 2020 18:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5BDAF801DB
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 18:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5BDAF801DB
Received: from mail-pf1-f200.google.com ([209.85.210.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1k5tnF-0006GI-Ip
 for alsa-devel@alsa-project.org; Wed, 12 Aug 2020 16:40:01 +0000
Received: by mail-pf1-f200.google.com with SMTP id 19so2205013pfu.20
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 09:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6Ji1lqucG/grb2OVN+O0IrjUWDOjIPmMeJi8EGBOR3U=;
 b=Ggs4PIaZPOY4s01XLZsZF9rodAlnEPLDYT4LJTO0J6d3Z+a//TyFD5/ZSSm2xC3VTF
 38aY1I4GIe30ABQzn8fcctl/MpspoN45giuVoz0nrfJYOVwDk/koLSyiUpWmoARvIN/N
 fcYXj750sV5U3VTNsKGuO7bPxMnyC/0fEuVVm/jTRoVeLO3fZ/oXBjHoaMWgAAjihe+t
 5i9VAyC+ynVZB9P/hf7/YGdrNvQWXErCr4ynDeh0CvAAnV0V/xeh5WaBCrXbUd9NzQ7V
 anhlLCr4GXUSXcolqHcB3FAGLuqayht/bCmD/hvSMt++6LxBUDZ4CoNZQ9GRrBMF+Y6v
 QLFw==
X-Gm-Message-State: AOAM533pP8rjY6wTJwPIzorISBOmVu517MAacgZoLCeSCeu2Rv4b5CuK
 u5nslSNIUtSrflM/0RvQr1W2ksxt6Ls9u6wG0KtTDUIanlUwlyIUm1zcwY6q1dbnzjOFrKpQsUn
 N8G3qI7eqKY42bfoKlXRkAVtICEw5X9KMUNlYOP+0
X-Received: by 2002:a17:90b:817:: with SMTP id
 bk23mr886024pjb.46.1597250400226; 
 Wed, 12 Aug 2020 09:40:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw53UL6r2FJ490XaYZR/YirtLM+MEb+vxIbXVyQDwdw7BkTzweu8CBj8oB5aCzPKtgJexKnhA==
X-Received: by 2002:a17:90b:817:: with SMTP id
 bk23mr885980pjb.46.1597250399735; 
 Wed, 12 Aug 2020 09:39:59 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id p127sm2835148pfb.17.2020.08.12.09.39.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Aug 2020 09:39:59 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] ALSA: hda/hdmi: Use force connectivity quirk on another
 HP desktop
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5ho8nfx3v9.wl-tiwai@suse.de>
Date: Thu, 13 Aug 2020 00:39:56 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <0466883E-8F02-4226-B153-F34558FC3A4A@canonical.com>
References: <20200811095336.32396-1-kai.heng.feng@canonical.com>
 <44573652-9ECF-4EC5-A234-DBB21FC90CC7@canonical.com>
 <s5ho8nfx3v9.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Aaron Plattner <aplattner@nvidia.com>, Harsha Priya <harshapriya.n@intel.com>,
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



> On Aug 12, 2020, at 23:47, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Wed, 12 Aug 2020 17:43:27 +0200,
> Kai-Heng Feng wrote:
>>=20
>> Hi,
>>=20
>>> On Aug 11, 2020, at 17:53, Kai-Heng Feng =
<kai.heng.feng@canonical.com> wrote:
>>>=20
>>> There's another HP desktop has buggy BIOS which flags the Port
>>> Connectivity bit as no connection.
>>>=20
>>> Apply force connectivity quirk to enable DP/HDMI audio.
>>>=20
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>=20
>> I guess this patch was omitted as well...
>=20
> Not omitted but applied to a wrong internal branch, sorry.
> Now I rebased to the proper branch and pushed out.

Thanks a lot!

Kai-Heng

>=20
>=20
> thanks,
>=20
> Takashi
>=20
>>=20
>> Kai-Heng
>>=20
>>> ---
>>> sound/pci/hda/patch_hdmi.c | 1 +
>>> 1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
>>> index 4bbd12d3b1b5..b8c8490e568b 100644
>>> --- a/sound/pci/hda/patch_hdmi.c
>>> +++ b/sound/pci/hda/patch_hdmi.c
>>> @@ -1863,6 +1863,7 @@ static int hdmi_add_cvt(struct hda_codec =
*codec, hda_nid_t cvt_nid)
>>> }
>>>=20
>>> static const struct snd_pci_quirk force_connect_list[] =3D {
>>> +	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
>>> 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
>>> 	{}
>>> };
>>> --=20
>>> 2.17.1
>>>=20
>>=20

