Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4723F2FBDB6
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:32:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C76E218D0;
	Tue, 19 Jan 2021 18:31:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C76E218D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611077555;
	bh=QnMPybGigwS02ynkQMbgxVmWNEP3rhnL3MUGEoWOx3w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=udDodvsvn2kkQzhHR7MGB2cjncQxNm6e70/LfN/D+dSAJ0FVuS/63LomcnvFfBPn/
	 FtxM527djGfdWOgZawXAJ/mwHGfqW/ERXHDLkPTDBkuVndl/4lWLG5yXcjsFQ5korP
	 BEX6kXiK4BXjYEkPo6PqX9ZoQFllu0a/uNWGSGiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B10CF8027D;
	Tue, 19 Jan 2021 18:31:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66912F80273; Tue, 19 Jan 2021 18:31:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CBF7F800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CBF7F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IQmb4F/D"
Received: by mail-wr1-x433.google.com with SMTP id m4so20523919wrx.9
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HwQ7smaLEtNvkmHMibo6rkKhwmggDii6CwKV9YcaQnM=;
 b=IQmb4F/D5RBk6+m5NZjGrzszyICYFm3hX1JxmI8UdhMIMDZeQEXBFednR40AuIdARb
 EeQFYSp4xZ8Zve02t4kECcH/sq++nVOFbnyA0S78HX2RV/CDoSgrgCUerHg0XT0ZIVkE
 P0H0JZ4boXtuohUDusTMg2EKr856w99cTwFiAUsXtaiI/17ZGpH0E5Mk4KzQ42EYwPDz
 Da4kgr8w1qe5lLRdSr/Db8dqBprQ0txJ0XirsNHDBhZZN9tIYphKIxfG23b/dXBDAEoM
 R+PSc+VEqeC1qZK7Hw0U/285dGEiOoh29sZvrFz7yJTcQ2v6rlXty4k6lzFHPQrGTGBx
 6zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HwQ7smaLEtNvkmHMibo6rkKhwmggDii6CwKV9YcaQnM=;
 b=Ez7Tp/PGGCd/ocF+1ZyHglB7VsD0GTDjZYKA/rms0rDhnvnrpFES8CCTVsV12eeERu
 5VlQj6lMzM8B2KJntbIR30g9V1fwLh/5FwVoyZjVkdqgBzCxifjcdk3myBAlheaXnbML
 UdOlrcKSy9ViteulKsA2sreWdA0jPOeFy/FxiEQ3CLKwF9RXLvBK1gYOCoKFbJyrHfkg
 9WXLb4cbKforTc879VwuAlBAFSuSge4xUYN8weqhL85ByCEPRmQRtJDzgTYQbB9WgUoS
 dkvC+FuRwyypEocAQ2VULX7vOo2wYaquJU4xVCvl9DO7ScFy4YF/sC/o2w8l+4H5FW8C
 4olQ==
X-Gm-Message-State: AOAM53355EFFpDXkyS/IX1OKFX85MqdA2aGopcpYLITD1x17z77Z3fDv
 2X95WRff9bTKg79tYZMGmQQ=
X-Google-Smtp-Source: ABdhPJz/Yv8ulkqJ/Azr75tKpCRQi/tbKsDErcdUxVGeaQAEyMzhpnuXiq5NprvTliL5gASyclaHqg==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr5377519wrq.238.1611077495584; 
 Tue, 19 Jan 2021 09:31:35 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g14sm5805612wru.45.2021.01.19.09.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:31:34 -0800 (PST)
Date: Tue, 19 Jan 2021 18:31:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/5] ALSA: hda/tegra: Use clk_bulk helpers
Message-ID: <YAcXddCDkWYIIqsK@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-2-digetx@gmail.com> <YAGzJM7BJqLV0xxY@ulmo>
 <b84c6d9f-e113-e249-cd76-248e2cd646ff@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="af5QIX/cdXc7DM/N"
Content-Disposition: inline
In-Reply-To: <b84c6d9f-e113-e249-cd76-248e2cd646ff@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Cc: alsa-devel@alsa-project.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--af5QIX/cdXc7DM/N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 02:31:35AM +0300, Dmitry Osipenko wrote:
> 15.01.2021 18:22, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >>  static int hda_tegra_first_init(struct azx *chip, struct platform_dev=
ice *pdev)
> >>  {
> >>  	struct hda_tegra *hda =3D container_of(chip, struct hda_tegra, chip);
> >> @@ -495,7 +441,11 @@ static int hda_tegra_probe(struct platform_device=
 *pdev)
> >>  		return err;
> >>  	}
> >> =20
> >> -	err =3D hda_tegra_init_clk(hda);
> >> +	hda->clocks[hda->nclocks++].id =3D "hda";
> >> +	hda->clocks[hda->nclocks++].id =3D "hda2hdmi";
> >> +	hda->clocks[hda->nclocks++].id =3D "hda2codec_2x";
> >=20
> > Originally the code did this in this order: "hda", "hda2codec_2x" and
> > "hda2hdmi". I don't expect the exact order to be very relevant, but was
> > there any particular reason to change it?
>=20
> The reason was "to make code look nicer". This was a conscious decision
> since indeed the clocks order shouldn't matter for this driver.

Yeah, it's probably fine. In case this ends up causing trouble after all
we can always change the order back.

Thierry

--af5QIX/cdXc7DM/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHF3UACgkQ3SOs138+
s6GPyQ/+Lynszet/5a+5cGwVUEi6sgRIdNW4xJL79sg5+ldGPV0VGBVLEEuX/vVJ
E+rhv53SOczraDUeSuu399geLmdy3uJdAvouUn40VWvxQbaBe5TJSGcHwQAzHT2u
3g/wzUk0nOqboYsTE79Tf7tn/+EGIGDT4hO9UI4zIe482GQ7WRtnHZIs8SncxcvQ
yGUWgjE8U8hOKYs8Nq7zJEaslAuyYHwjjzEmpQ7DLZg3L9jEYnhZccIEuFgct338
ki6J52wF4xaMP+a+Rwr2eteorNqc3SZp74J3s2Q/xD5dAhTDc2VQHnwZEaSxovNn
5MgvYv46TWH3MOEFGuOBPOepT72wsK2q2pnYd4a6ov5wyJVe3aOY6b/DUYj5VZEH
NkmgUZYxObxFZox2EXoAvSmR331w4heRqcuq54lSw5XdIOMMTxLrwkv0GNRvM1WN
owkkxWQY9PTvCJn/FICmMXuj9jhotup+294pIeDwo88u6IYuwsuknm5N4tMF4RDc
3YE4Rb2ptq05hVmbPGJbDbGn9qDXPDgEQ8Qe+ZfgTPCF27FAvarNgJs4WGoF4wYN
aX14+yMHW191WsnpTlpKpJXnZvy9z6/SzmXPSzeMhthBByDmIk8JGbqyingJlFAS
ZRHssj6TpRts8RcQJu6FvoANQyqgEvJvgGhVDBvdgOcd4bN8Gmc=
=t2N3
-----END PGP SIGNATURE-----

--af5QIX/cdXc7DM/N--
