Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1E913DE31
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 15:58:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5645817B5;
	Thu, 16 Jan 2020 15:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5645817B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579186739;
	bh=DBrw3EZPrYP8OWSxCXyCbUt7qxg/AgSn/tb/EYnQnL4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yd9hOAdCyVniE6AfPzr2O33PHg8G0EW3ll6Q27ZzJY9woGwRwz/sqDCCSLYqP7iQD
	 G7OdGXTOAspgJlgRyVX1LpzATvRBu0ulyzeG8HFKaXefGfjjy1Xe495bXs4Ic29W9B
	 7OYmrs6kO77M24hrZGDclJDI/eIjgXJSgWusncLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A558AF800E9;
	Thu, 16 Jan 2020 15:57:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A81CF8014E; Thu, 16 Jan 2020 15:57:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8E89F800E9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 15:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8E89F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FjXodQFP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=22z5E0u87kHNoozTbscliqfal4njwdMZgZbh9CdIPA0=; b=FjXodQFPMwJ37xjkPRFMd30Bn
 mHQoi7G1cOgS1UnaGQ89D7byMxuFUUJFLcUHLSsfaTP7vSJWnFTfvjSRnsYkVfHrH8aM/u//wjsUV
 E8cwyXggg3DxBu/T8SZFKxSDM5A7wzBjoldliruMbW49BH89FY30xRPg9RzyoaoE3wYYk=;
Received: from [195.89.128.25] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1is6a5-0001Yh-6q; Thu, 16 Jan 2020 14:57:09 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 94019D01965; Thu, 16 Jan 2020 14:57:08 +0000 (GMT)
Date: Thu, 16 Jan 2020 14:57:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200116145708.GQ3897@sirena.org.uk>
References: <CAKzrAgTD2oeyajKGOaPea98vZ-uKJOn6uOqABA+CKtpvYpWYvQ@mail.gmail.com>
 <CAKzrAgTCE4btXr04pkvLUG6PPbtn9dm5h_9rjqDYG0HrTZ0zbg@mail.gmail.com>
 <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
 <130af222-1086-ebcf-6a0f-9a390f9afbc3@linux.intel.com>
 <CAKzrAgRJZd4UZjt411vA8WwUv1KyVahVTNyUS8nA1TbKsA57dg@mail.gmail.com>
 <14259e97-72f5-439f-b2f1-356b6e45bcfb@linux.intel.com>
 <CAKzrAgQR0iZWPCudQ6k+RNWGk3L-=UU792RW6s7LxF+8wOPDUw@mail.gmail.com>
 <7de214eb-d6a0-3f86-9eb3-76488f0ec99f@linux.intel.com>
 <87r2001bsi.wl-kuninori.morimoto.gx@renesas.com>
 <6d0f1830-a2f0-997a-99cc-05c268acefc6@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <6d0f1830-a2f0-997a-99cc-05c268acefc6@linux.intel.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, ojab // <ojab@ojab.ru>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] No sound since 5.4 on skl_n88l25_s4567
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
Content-Type: multipart/mixed; boundary="===============5423265549655224813=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5423265549655224813==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I/ISuq5xXXs4T7+3"
Content-Disposition: inline


--I/ISuq5xXXs4T7+3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 15, 2020 at 07:04:48PM -0600, Pierre-Louis Bossart wrote:

> Maybe we could have some sort of boolean flag in the component->driver
> definition and explicitly request a backwards-compatible behavior (e.g. for
> all SKL/KBL machine drivers) when that driver is known to be flaky. There's
> already things like 'fully_routed', maybe we can add something such as
> 'disable_route_check'?

A quirk for old stuff that can't be fixed sounds like a sensible
solution to this.

--I/ISuq5xXXs4T7+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4gecEACgkQJNaLcl1U
h9BwEAf/QMb5QlAYeezvqBYwDlicxLnQNUlPvQxeZBMuHi7XDhm173QmY0VqG63q
H70iPXtMd68LazBna/FkqXzKPioA7KF3ucHBBU4YG7G7XYpL4bkzJptbt+6+Msx2
Fo5DAG7IUzxwy/KcJHCLGfjUKBrRe3NEgwYfP+HGE1K3romEZOE02CU+vdDRXgKE
f8DiKnyy8KPtdZS402EQRqPne2nfFihnG70fANQ9SEQ+rcrImfLY7jkhzhcYQ0Sd
Zr8uc0pJRRkIHqvh7HuJuUwrBX077MfPq9YkX4OKwlPdU6RgB0KCZUJR6RGyT6bM
Mhgs/fuU8F9r+tfq4q/xaRfCazT1kQ==
=zAub
-----END PGP SIGNATURE-----

--I/ISuq5xXXs4T7+3--

--===============5423265549655224813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5423265549655224813==--
