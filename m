Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 807EA242C49
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 17:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18250166F;
	Wed, 12 Aug 2020 17:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18250166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597247129;
	bh=eng3tm0HMuW4W02oJwcetY9vbRKTYgn8HhnKlm9ceIc=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqpbSErEBjvRW1et5LuRyfEK8CnaL7uq5vJjgknciveOwGtqwsuxg7JMN2RtZDGYR
	 /dm5PrGn8NqRZkmrjzeSrM6ibkMuCxzJUICQS3/L67HfEA7wUHfP6wiBES3z2woPxo
	 yS4/VaOy5U44UmvlieaU3Fz7SNAzjE8HzgfCZdrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F92CF800D3;
	Wed, 12 Aug 2020 17:43:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02558F8022B; Wed, 12 Aug 2020 17:43:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E25EFF80147
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 17:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E25EFF80147
Received: from mail-pf1-f199.google.com ([209.85.210.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1k5sua-0001ui-Cd
 for alsa-devel@alsa-project.org; Wed, 12 Aug 2020 15:43:32 +0000
Received: by mail-pf1-f199.google.com with SMTP id b142so2093942pfb.9
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 08:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=bi7NxsjcH5FLItJoaT5RnTY7tEaw2OwMf3N159WZ0VQ=;
 b=jyowEq291H7KMqhnInOE7+oIfyjYAJYCp3bWQV6st+Zt+2Ge1b2MuAAZQfqqDTyztD
 G51Vo9+d6P5Ybe9Lw4m33yHFzxi3UfCfbVXz9oMdyyM5iJ1z0OT4NvIk8OjXlqWAqZD6
 HobARlMbl026Dym8Tv8OBu6nO3lePtZGa5D8YQXfQRfSFkwnrLPfnwioo5wcAt7ikl1m
 IbG3FGAfF+6G4WXH259UaW9zMA1ScK1DG+5zf/2bPK2Zf0ehFXqzU1mHZ5AOqyOz/Gmn
 91CP3SFC/ljKT5MdXTiMl9wYCdaG1UXLbLzez6imvsxGMGJDtMk56rgTGmZog2d1NZJV
 lY3g==
X-Gm-Message-State: AOAM5317lb5acxgW33ZtEgDxGAJkq+TZsT5GyViPZhJn/ujpILu11wnL
 WkB2oUHuh+qWwfml6NY7yRsYfTz8OQh+ntvRPwJCXPi5YNhyLzVGkndsph6VA1JUWgVT1MaaV8k
 jYeKpZid8n6p1a6QRdBef5b2OfP41kvBb5hsRfWRL
X-Received: by 2002:a17:902:264:: with SMTP id 91mr79138plc.88.1597247011046; 
 Wed, 12 Aug 2020 08:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG49h0aM9tFV64seogfDK8Y70jGf7oGrMg4IRq6Jv05oEpnwun9XBdOJCwcOPg9ZrTGy0SBQ==
X-Received: by 2002:a17:902:264:: with SMTP id 91mr79104plc.88.1597247010541; 
 Wed, 12 Aug 2020 08:43:30 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id g10sm2972957pfb.82.2020.08.12.08.43.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Aug 2020 08:43:29 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] ALSA: hda/hdmi: Use force connectivity quirk on another
 HP desktop
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200811095336.32396-1-kai.heng.feng@canonical.com>
Date: Wed, 12 Aug 2020 23:43:27 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <44573652-9ECF-4EC5-A234-DBB21FC90CC7@canonical.com>
References: <20200811095336.32396-1-kai.heng.feng@canonical.com>
To: tiwai@suse.com
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Aaron Plattner <aplattner@nvidia.com>, Harsha Priya <harshapriya.n@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>
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

> On Aug 11, 2020, at 17:53, Kai-Heng Feng <kai.heng.feng@canonical.com> =
wrote:
>=20
> There's another HP desktop has buggy BIOS which flags the Port
> Connectivity bit as no connection.
>=20
> Apply force connectivity quirk to enable DP/HDMI audio.
>=20
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

I guess this patch was omitted as well...

Kai-Heng

> ---
> sound/pci/hda/patch_hdmi.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
> index 4bbd12d3b1b5..b8c8490e568b 100644
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -1863,6 +1863,7 @@ static int hdmi_add_cvt(struct hda_codec *codec, =
hda_nid_t cvt_nid)
> }
>=20
> static const struct snd_pci_quirk force_connect_list[] =3D {
> +	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
> 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
> 	{}
> };
> --=20
> 2.17.1
>=20

