Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 441511F6A5F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 16:54:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76D3A1690;
	Thu, 11 Jun 2020 16:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76D3A1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591887258;
	bh=QAQH/7Z8jNXkQ8OwsLHpiJjUUIq1NJokMEv1S/RsXWc=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AdnHg+ch86PrH5weD/rXuvgeT5Rxr9LyXpSd6C2CDFBaJTQNXMQrJx1RP1uV2RFt7
	 mL/18aSvJFuzf14Ffhs5m5DG/AR7fxs2BnjdSD9qiFXHpNYId2sXhoUhOGwA8gcUx6
	 MgrT6K00eozXwOQx00AlR1rIH35Oepa3OcbUVHNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83E0DF80299;
	Thu, 11 Jun 2020 16:52:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1C2EF80299; Thu, 11 Jun 2020 16:52:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from sonic301-21.consmr.mail.gq1.yahoo.com
 (sonic301-21.consmr.mail.gq1.yahoo.com [98.137.64.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AF42F8028C
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 16:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AF42F8028C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca
 header.b="uNpqi2vR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1591887121; bh=ubPouQ9Xy3jD3XhRdWP4bfCt4xkdJz6IW6/Ib5Sl8Ac=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject;
 b=uNpqi2vR0OsuFPmw4Ewgd7A2Y0WIDbciOaoVS3cQfC45VkmI1lmFS9h6Zy7P5vCx/vfuWLTgueAUPGfnSvDx2Ryad0pHqBgZS1vBVQLGtCcgvWhiek+P+kVBFpUBvhWKg7sqlqEEdjC9ieV41l1A9vT3BdjPTIQHBbBdCmN+cBYaJGOfqGNiNKYbDwVkRFCJh/6FLOZfjmsnGEnI+6ZMLW5j5HVP9r6UUuFgksZRZ3zT579JobdSHUVkpTdiUlgbbK7ouh+ZvzoPALmAJSaMgv9BoEowwVdUWtdTLpPI282/GDnAwmMsuEtRFk6Ib6T2rJ5TGiwDHBpNRqpzNtCbPA==
X-YMail-OSG: aZdqEXsVM1mGmKp1hG5N3D_jCXDweXcWIzN5LThAMudZ.O.zcMDgM.PP8tFNpOo
 rFJa4yVUrEZtawWtfAu8eJfhFsEqtZE.qbe65a4tHNfcWEuN9J53RRtZKYRqvdgYpFsb2A02UhZf
 OmEoKJFRV7.Cl0mR4Mm.zSd3eHuHMMV19WwZwtO87Bb3onQz_XRlkpFLm_vlM8LZbH2q5woyJe5I
 PZKRUUiHyUkVBZz1huWYdiqoTO2dHXFycjG5ohb.Pn7A6g2wc3fR64whkZB5tzYEh.SBB9RkHqn1
 K72.Qa69H1.17uHxbHificWrYVGjUDjQH_RPFe0z7pfcqHI0e1yQUhT60qvZTuopGFe3vlB83Etg
 St0LxQpofH3FXQDGnhdplArnbbR5u02qblHkI5_FiAgls9pZnHXwcU9ZCSDj1lqIz11q59uETvDR
 H2cGF76b.efEqIBBeGCoL2f039aW4OjG4iiU2Ej8UVAEqE.DGzfB7gmGNl7UFsfOv7jrVOx4I0Wa
 vgu4RUwvQUogj36DWZYyhthbS6ZYAWOn2og3rrsCAeKAU9XC.2w5lc.6WAtNqXQxSuA4V6KbRhAO
 2gxmmFEpy7Y4EvFFVPky58C8q51hmmtgIUDVhT0mpkEBEwf0DQmntbK_nziXBlFTb3mBJFSRQNPt
 144ryTHuJCEAbMD6iPa6t_w_EqV2aI9AJDlVzxwmw0HSYN2Mxq.nDZiApWwQR9lJAZAP2osHt_4T
 K11Yt881_mJAhwgJvVaXTP5awz6GonIxF4TskfTPrEdQ67gf15doqYFfEg9boliLPmpRX5C.GjuR
 bS8NGNqqWG2FWhSMo.X2clW0qZUyak1ztr7vaTILFamTrt4nMUGrL9YghzE5cgbb6r2Oz6Zc6xg1
 Yg0x7qvw1jSEYKdeKml5M3gT0.c1qYWUcjet2sRb7Se3gWXOMEtIas01T_nbecRUU.RzU.ynChma
 buNvKBHhEBn3J07RxRhnYKURe.pDitOWLa8raj._t1CuWfS1.rz2WoWnfQrBL_5yWYZxQj0ynTzx
 TGunAG.1kyMcLCKPNyIJdEG5K0TZrYjG9r4Jm7iiSf3XMgwFIEfBGBRwQOjovFLpHxSvCWq97y2B
 b570V.40jKv65bz633sZjPTF2akljszzrZoQh6hC.kjJXKdCgxuOTTJ17YLLpHozbZKP1MQm.USy
 pin5ryUmcR745O9IahIx0j03M8cYmxqUHiq9GpoqWCZQLUISCoWwZ57wXH.6s8FyZPQQecYtTOI.
 pyE2JFRnHKCsGvvMXNx3kjXEw_Arh2AzN.QrVRu92_2ceojpFIxPp7O5KlVDR5cM3yo823SICiGu
 MXluZHa8kHsqDKIr9d_egwK0FvLbJ66m66xbBD1vflHZiyWLo4NAMil_HYDKA9sVCpf5rGqFf8oX
 lRw50s7dfRbFGvA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Thu, 11 Jun 2020 14:52:01 +0000
Received: by smtp430.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID d23dec023b11027fb01c355b982896cf; 
 Thu, 11 Jun 2020 14:52:00 +0000 (UTC)
Date: Thu, 11 Jun 2020 10:51:56 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
To: Christoph Hellwig <hch@lst.de>
References: <20200520111136.GA3802@amd>
 <1591545088.74ii116nf2.none@localhost> <20200608061950.GA17476@lst.de>
 <1591624340.z01ejtod28.none@localhost> <20200609114733.GA1621@lst.de>
In-Reply-To: <20200609114733.GA1621@lst.de>
MIME-Version: 1.0
Message-Id: <1591887082.rbi6gq03l0.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.16072 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, rientjes@google.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 mingo@redhat.com, bp@alien8.de, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com,
 tglx@linutronix.de
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

Excerpts from Christoph Hellwig's message of June 9, 2020 7:47 am:
> Alex, can you try this patch?
>=20
> diff --git a/sound/core/Kconfig b/sound/core/Kconfig
> index d4554f376160a9..10b06e575a7fc5 100644
> --- a/sound/core/Kconfig
> +++ b/sound/core/Kconfig
> @@ -192,6 +192,6 @@ config SND_VMASTER
> =20
>  config SND_DMA_SGBUF
>  	def_bool y
> -	depends on X86
> +	depends on BROKEN
> =20
>  source "sound/core/seq/Kconfig"
>=20

Sorry, this patch doesn't work for me with SME off using abfbb29297c2.=20
David's newest submitted patch works for me, which I already replied to=20
separately.

Thanks,
Alex.
