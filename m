Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F45C1A75F8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 10:25:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5A3E1691;
	Tue, 14 Apr 2020 10:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5A3E1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586852737;
	bh=pGScV973+b8s8Fc10B9qIDznuSroNJWU2CigKoyzgMc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KaAvUc4jiXdE7IObQr8seJu6Fn7SvieoFIG7teFJySCN/hdh4NJU7r4+9vgH/HboD
	 /VVTpDKCJJQb+h3HgfO74KiMrlX8h2xC9xlmbEdEc0o5zbXAe/1QkI0BWDVKxF8Bxp
	 Rc5LEy5aTvpgJTvY3176npVWcYRUuoZToY1/2JvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B42D6F8014E;
	Tue, 14 Apr 2020 10:23:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE2BFF8013D; Tue, 14 Apr 2020 10:23:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBA2DF800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 10:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBA2DF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="fQfpqZrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586852613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrNcW34kAVY/B4TDBSPYvXa2NXdFYlmM2D7QLh5Rdco=;
 b=fQfpqZrfmV9gdxZJXSi3fgZmqFIaHdbpqRsY4InH3zkEk8VdKTUguG3cNi2JnZS9QN0nr8
 WZdb5rktUBaZfevPTRBIr2agz7QP+XPmD0i2Ruz0dSMb8TKlpRn0DRQgBjwMTznjZD8YNO
 HdPjfDvzqqTI7BPpBmPQOwvSFHeKQkY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-cz0bKQN3OgOCpjKnVw5Q_g-1; Tue, 14 Apr 2020 04:23:27 -0400
X-MC-Unique: cz0bKQN3OgOCpjKnVw5Q_g-1
Received: by mail-wr1-f72.google.com with SMTP id o12so5232232wra.14
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 01:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H+VxrzKvcZtuRyRLVrc+QHxAVFwBv0r3POXnmXn8soo=;
 b=by4oZ+XX38WqpFAjW7EgCCxGmk+5wMbp1nY4J+Uunk3/YdJLFwEIcbCCn/ZoMAifAp
 eycIhWl6bycYg+IjSj7RQXfGYfcg0gzgKg4cCSUDm5sOTwyHPqMsqIWAwm2HahYm1hmX
 WjHLsrQC1ZN37Gvx4UDHYMd7gCTgauWs1hlTY9X4IRG9qHCX6/dyAb3O6CbC9q2fa2zh
 JV/78L29v5DYPzflAFj1kKpoxJnN3qFzp42oysvhI1Ll+f2G4Gl0x9+1Q4jWHKWE6BGU
 kR3CNAg/fpjGCJt6feCd6ykzVirkF0NOqqdE7axwT5MUHmOU0uJ4ScBNWRLRcI6E2Fz0
 ZQ8g==
X-Gm-Message-State: AGi0PubWD+ld/QR2mbaORrgk/TU37qrzPnKL166nA3pnmOrowfLI2cek
 ygDKlMGJ0njeVwTnyps2zdgyiI41iQTLZvBAfc8T2xRF7590IaR80nwr6VtY+7+R6djW3nMZRbS
 RhtAuJD2pvPQAYQPl3Mmn1pE=
X-Received: by 2002:a1c:6455:: with SMTP id y82mr14954309wmb.128.1586852606399; 
 Tue, 14 Apr 2020 01:23:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypK6112R513ynMSelx6Axj+sWLV49owY8aiZ3p36iI8gEpLcw4EE+TwH/OqmGNN3zUuwVDbBKQ==
X-Received: by 2002:a1c:6455:: with SMTP id y82mr14954299wmb.128.1586852606226; 
 Tue, 14 Apr 2020 01:23:26 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id c1sm17385653wrc.4.2020.04.14.01.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 01:23:25 -0700 (PDT)
Subject: Re: Regression on Intel Atom/SST/Baytrail devices w/ v5.7-rc1
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>
References: <4d9d2c14-4db7-1a98-9b3d-e9193333e1b9@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c863319e-51bf-37e9-e550-5f1af1267408@redhat.com>
Date: Tue, 14 Apr 2020 10:23:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4d9d2c14-4db7-1a98-9b3d-e9193333e1b9@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Takashi Iwai <tiwai@suse.de>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On 4/14/20 4:02 AM, Pierre-Louis Bossart wrote:
> Hi,
> With Mark's for-next tree and v5.7-rc1 I get these really bad errors with=
 the Atom/SST driver on a Baytrail device - found by accident while trying =
to validate UCM changes.
>=20
> [=C2=A0=C2=A0=C2=A0 9.741953] intel_sst_acpi 80860F28:00: FW Version 01.0=
c.00.01
> [=C2=A0=C2=A0=C2=A0 9.832992] intel_sst_acpi 80860F28:00: FW sent error r=
esponse 0x40034
> [=C2=A0=C2=A0=C2=A0 9.833019] intel_sst_acpi 80860F28:00: FW alloc failed=
 ret -4
> [=C2=A0=C2=A0=C2=A0 9.833028] intel_sst_acpi 80860F28:00: sst_get_stream =
returned err -5
> [=C2=A0=C2=A0=C2=A0 9.833033] sst-mfld-platform sst-mfld-platform: ASoC: =
DAI prepare error: -5
> [=C2=A0=C2=A0=C2=A0 9.833037]=C2=A0 Baytrail Audio Port: ASoC: prepare FE=
 Baytrail Audio Port failed
> [=C2=A0=C2=A0=C2=A0 9.853942] intel_sst_acpi 80860F28:00: FW sent error r=
esponse 0x40034
> [=C2=A0=C2=A0=C2=A0 9.853974] intel_sst_acpi 80860F28:00: FW alloc failed=
 ret -4
> [=C2=A0=C2=A0=C2=A0 9.853984] intel_sst_acpi 80860F28:00: sst_get_stream =
returned err -5
> [=C2=A0=C2=A0=C2=A0 9.853990] sst-mfld-platform sst-mfld-platform: ASoC: =
DAI prepare error: -5
> [=C2=A0=C2=A0=C2=A0 9.853994]=C2=A0 Baytrail Audio Port: ASoC: prepare FE=
 Baytrail Audio Port failed
>=20
> Trying to bisect, the errors change at some point:
>=20
> [c77b8317ee3ab43634421afb73fdb1ea253d3d47] ASoC: mediatek: mt8183-da7219:=
 use SND_SOC_DAPM_PINCTRL in TDM out
>=20
> [=C2=A0=C2=A0=C2=A0 9.387540] bytcr_rt5640 bytcr_rt5640: ASoC: can't get =
playback BE for Headset Playback
> [=C2=A0=C2=A0=C2=A0 9.387551] bytcr_rt5640 bytcr_rt5640: ASoC: can't get =
playback BE for media1_in
> [=C2=A0=C2=A0=C2=A0 9.387556] bytcr_rt5640 bytcr_rt5640: ASoC: can't get =
playback BE for media0_out mix 0
> [=C2=A0=C2=A0=C2=A0 9.387561] bytcr_rt5640 bytcr_rt5640: ASoC: can't get =
playback BE for media0_out
> [=C2=A0=C2=A0=C2=A0 9.387566] bytcr_rt5640 bytcr_rt5640: ASoC: can't get =
playback BE for pcm0_in
> [=C2=A0=C2=A0=C2=A0 9.387570] bytcr_rt5640 bytcr_rt5640: ASoC: can't get =
playback BE for modem_out mix 0
> [=C2=A0=C2=A0=C2=A0 9.387575] bytcr_rt5640 bytcr_rt5640: ASoC: can't get =
playback BE for modem_out
> [=C2=A0=C2=A0=C2=A0 9.387580] bytcr_rt5640 bytcr_rt5640: ASoC: can't get =
playback BE for codec_out0 mix 0
> [=C2=A0=C2=A0=C2=A0 9.387584] bytcr_rt5640 bytcr_rt5640: ASoC: can't get =
playback BE for codec_out0
>=20
> And then from
> [5d3c644773925c3568617435e42a9404a114c428] drm/mediatek: support HDMI jac=
k status reporting to v5.6-rc1 I get those time outs...
>=20
> [=C2=A0=C2=A0 21.031638] intel_sst_acpi 80860F28:00: Wait timed-out condi=
tion:0x0, msg_id:0x1 fw_state 0x3
> [=C2=A0=C2=A0 21.031661] intel_sst_acpi 80860F28:00: fw returned err -16
> [=C2=A0=C2=A0 21.031692] sst-mfld-platform sst-mfld-platform: ASoC: PRE_P=
MD: pcm0_in event failed: -16
>=20
> Both 5.5 and 5.6 work though, as if we are missing a set of dependencies?=
 I am running out of time this evening, but I'd be good to see if anyone el=
se reproduces my findings.

I saw the same thing yesterday, also when testing UCM changes :)

I was planning to bisect this myself today. But given your findings I'm not=
 sure
if that is useful.  I would count the intermediate errors as also being bad=
 I guess
and try to find the first bad commit and see from there.

Can you send me your git bisect log ?

Regards,

Hans

