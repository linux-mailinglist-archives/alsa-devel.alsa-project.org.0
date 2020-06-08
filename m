Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A171F1154
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 04:17:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 086921664;
	Mon,  8 Jun 2020 04:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 086921664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591582672;
	bh=1ODzG2dGb4QsCKZ97AGjnS71Y4Y74OrtemWBwKMjoJ4=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F/gHZftN2W/GTm9zHmP30co+QdamDp11pRSGaoHbYTr92A6NR629kxeC0a4OO2AUK
	 Ke37So2OHJW00y4gJhTwmmfRmQLH1uL5fwDn4FidaehpMKQ1A8KazANQpqykCZsc0f
	 YzsObWI1mcyTPlAeyrF+nSbofXFi4+W+sqRT7VhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26A4CF801F7;
	Mon,  8 Jun 2020 04:16:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 874E3F8021C; Mon,  8 Jun 2020 04:16:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_NEUTRAL autolearn=disabled
 version=3.4.0
Received: from sonic306-48.consmr.mail.gq1.yahoo.com
 (sonic306-48.consmr.mail.gq1.yahoo.com [98.137.68.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C8FAF801EB
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 04:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C8FAF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca
 header.b="hbSl9fSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1591582547; bh=LeNZHONdlm6bcYug9q3xuSIHrVN5iUaoxaV6Ago7nbU=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject;
 b=hbSl9fSAaV+D3pugnsrFXMzN8fmQUT/2+N/GnpbslnifsZal7YrZOMPxmAsYqEX9cVCNw3kPhLQIUXd2ImeZOy85ixESRKVKOiJ/T1y1B0f8+PK/Lbu/RbGkvvAgqvj2+m8FIPGlWuirFh4ajkKZnpFDcAqodR/Ksc3122TRYKEI0BecV4Lk+eYZuEQQLbUk6OFlg26TlqUYGMl5mFcd1dJgBjkj06biu0Tulbh4fuzPC1IbUE2f32VhYc1qOdgEWNtYZ/GmVHAAB5yTsHUP9gSt7h1vSQ9YKuO3c9VStNbsU6kO9cgWDyY+56Dk+zW5fggGjJVVfZeBFIOM3aABEQ==
X-YMail-OSG: N_6BpMEVRDvd.miR6A7lED5GPdAEx7ojsA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Mon, 8 Jun 2020 02:15:47 +0000
Received: by smtp431.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 3b13a0cd26292fd40daa8b7a3122671d; 
 Mon, 08 Jun 2020 02:13:45 +0000 (UTC)
Date: Sun, 07 Jun 2020 22:13:42 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: 82fef0ad811f "x86/mm: unencrypted non-blocking DMA allocations
 use coherent pools" was Re: next-0519 on thinkpad x60: sound related? window
 manager crash
To: David Rientjes <rientjes@google.com>
References: <20200520111136.GA3802@amd>
 <1591545088.74ii116nf2.none@localhost> <20200607163803.GA10303@duo.ucw.cz>
 <alpine.DEB.2.22.394.2006071209470.84952@chino.kir.corp.google.com>
 <1591570155.2tn9o40h95.none@localhost>
 <alpine.DEB.2.22.394.2006071756040.138746@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.22.394.2006071756040.138746@chino.kir.corp.google.com>
MIME-Version: 1.0
Message-Id: <1591582140.kcn3hpk42g.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.16072 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, mingo@redhat.com,
 bp@alien8.de, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com, tglx@linutronix.de,
 hch@lst.de
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

Excerpts from David Rientjes's message of June 7, 2020 8:57 pm:
> Thanks for trying it out, Alex.  Would you mind sending your .config and=20
> command line?  I assume either mem_encrypt=3Don or=20
> CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is enabled.
>=20
> Could you also give this a try?
>=20
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -99,10 +99,11 @@ static inline bool dma_should_alloc_from_pool(struct =
device *dev, gfp_t gfp,
>  static inline bool dma_should_free_from_pool(struct device *dev,
>  					     unsigned long attrs)
>  {
> -	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
> +	if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
> +		return false;
> +	if (force_dma_unencrypted(dev))
>  		return true;
> -	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> -	    !force_dma_unencrypted(dev))
> +	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING)
>  		return false;
>  	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP))
>  		return true;
>=20

This patch doesn't work for me either. It has since occurred to me that=20
while I do have CONFIG_AMD_MEM_ENCYRPT=3Dy, I have=20
CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT=3Dn, because it was broken with=20
amdgpu (unfortunately a downgrade from radeon in this respect). Tried it=20
again just now and it looks like it's now able to enable KMS, but all it=20
displays is serious-looking errors.

Sorry for not mentioning that earlier. I'll send you my .config and=20
command line off-list.

Thanks,
Alex.
