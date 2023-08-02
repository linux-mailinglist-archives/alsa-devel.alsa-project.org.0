Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC676D3D4
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 18:36:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B11B26C0;
	Wed,  2 Aug 2023 18:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B11B26C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690994165;
	bh=AOfBkckMWg/Zv9Qeci/TKBZe0KTRG/POb/R4svL04uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iP4dKzOgjcNy7O6wWSOk4tSl77/4MUa92Vsp5ghexvZIJu/Z3IHIQx3OZcot+MPaP
	 ALshhJVCrz9x0cp5s1WVRVXTojVoTC/+UPBnffV1vpesLAKSYVqiEzj8JZvj6JbGpj
	 OyOzGP5U1PC70o8VMoSBP63Pyq8PPbm6PgEM8gGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBC4FF8025A; Wed,  2 Aug 2023 18:35:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 293A6F8016D;
	Wed,  2 Aug 2023 18:35:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B35FF8025A; Wed,  2 Aug 2023 18:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3AC2F80087
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 18:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3AC2F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KUy4Mg24
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D5C261A18;
	Wed,  2 Aug 2023 16:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05860C433C8;
	Wed,  2 Aug 2023 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690994100;
	bh=AOfBkckMWg/Zv9Qeci/TKBZe0KTRG/POb/R4svL04uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KUy4Mg24Kn+OjW2VmsWDIt1Z2cAxtcEDf5XvCw1crh9NMoJWz1VkJmz2XJe9RrCzj
	 VGpGskFhMiX3U6eIanuZ5up2Mm2ej1j7sZfaP40FaD85CIwEGF1jL3568e6Hfj7JJW
	 2gtCVQseKOzlEXRt2ayah+dvkkIgJdwmcu2G+Qb0pKrbDKPK3b24tlHFUe/7aKZtdW
	 VsKgQQPcSit1XYtqYzYLKpC81ZQHV70nN1M4kF1VyfoDqLjgFmazFCgbb3zeeyVgdQ
	 w12JMevIgXK7S4nooMCaMdR5BypCRFhCyg7/TgeQAmPMUrwM/g+CoGLmwv5kuJgarS
	 GDDqqMF83wgwg==
Date: Wed, 2 Aug 2023 17:34:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/5] PCI: add ArrowLake-S PCI ID for Intel HDAudio
 subsystem.
Message-ID: <b1c21bfb-2d47-4c42-87b7-2846de02e017@sirena.org.uk>
References: <206f5a15-29f0-ec7c-1b85-50ace8ae7c2f@linux.intel.com>
 <20230802162541.GA60855@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nDCm4xq2KGstjQxb"
Content-Disposition: inline
In-Reply-To: <20230802162541.GA60855@bhelgaas>
X-Cookie: Humpty Dumpty was pushed.
Message-ID-Hash: 2AMXE4AGLS3Z4YG3SDGE23MOLMQ7UF7F
X-Message-ID-Hash: 2AMXE4AGLS3Z4YG3SDGE23MOLMQ7UF7F
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AMXE4AGLS3Z4YG3SDGE23MOLMQ7UF7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--nDCm4xq2KGstjQxb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 02, 2023 at 11:25:41AM -0500, Bjorn Helgaas wrote:
> On Wed, Aug 02, 2023 at 11:07:36AM -0500, Pierre-Louis Bossart wrote:

> > I am not following. we just agreed a couple of weeks ago to record ALL
> > Intel/HDaudio PCI IDs in the same pci_ids.h include file.

> I'm not sure who "we" is here.  If it included me and I signed up to
> it, I apologize for forgetting, and go ahead and add my:

>   Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> I'm just pointing out the usual practice for pci_ids.h, as mentioned
> in the file itself.

I think the thing with these drivers is that we know they will become
shared in fairly short order so it just becomes overhead to add then
move the identifier and update.

--nDCm4xq2KGstjQxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTKha8ACgkQJNaLcl1U
h9A2VwgAglurzqV8VFhBmiWGHc6Kt7qIJ8LB6Qx6XOOzu8ZHjz8YUKuEvbYtwJz1
gepgsQc2e3TF+Txjm1duI1YJxQ1Z/vUZlTkHf05WmGjZAD3S6AryJCSOdcGfmE9/
k7OdT8BwsvKSicDMrdyH/hgutWaLe/EnOvL/hbw7Zduq1s3aVZNVOcsqf9rp22dD
r8zWYkWynqB776wcZ+yqVaZdWU+7HmDpzt8AOLaxhUScdrsTFMBZiDDNvdDnQB5J
virp0KLewrLUxI6WSicA24n79wWLJtg39zoUAxfcyYxJi2vyN1Bqmhdp+qnYaGf9
vSn0kRzb0zcx7Mdt9bABOEcrTwRuxw==
=vPUz
-----END PGP SIGNATURE-----

--nDCm4xq2KGstjQxb--
