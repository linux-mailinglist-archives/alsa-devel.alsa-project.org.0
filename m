Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6152C1352
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 19:46:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49B051663;
	Mon, 23 Nov 2020 19:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49B051663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606157204;
	bh=RrUfeAtqPlw2pkJrVTmSF81Kk1DPCPCipvGVpz/M73o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kV0AOykhmPi0llozXGJ7GqnanFvwcIVCdC7KxnW1s0NXFQZbhXkCmqnxWAFu/SFrV
	 Hbxc6mDP2s6CCJmPwGtQmVxuXkfNkYoP1f98qsq9ip7JZrLlHi4Md7oS4pLd8yQYWM
	 X2IyRPDQcKkB3VxM5OM8kSEtHTiDY7v3HT6TrcBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5F43F80113;
	Mon, 23 Nov 2020 19:45:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92DBCF80255; Mon, 23 Nov 2020 19:45:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D438DF8015B
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 19:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D438DF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rlbBKyDQ"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DF3F20702;
 Mon, 23 Nov 2020 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606157098;
 bh=RrUfeAtqPlw2pkJrVTmSF81Kk1DPCPCipvGVpz/M73o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rlbBKyDQjb6Yo4A2e4oHkBKckmgWSnZUXvsIOYP+NU7gUipsSw4FoBza0sCOOWrzT
 uP5qU8TwdPUQYl4KuCI6f6+kK4HBYHKrYkRf4WN5YqNXOCKzh73iJTpm4CEitpX9yl
 gBhDFibHUiNCtZAEErxzV4z4lTcLefrPMwAujrq0=
Date: Mon, 23 Nov 2020 18:44:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/5] soundwire: SDCA: add helper macro to access controls
Message-ID: <20201123184435.GQ6322@sirena.org.uk>
References: <20201103172226.4278-1-yung-chuan.liao@linux.intel.com>
 <20201103172226.4278-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UJEqbsikIZBgizPR"
Content-Disposition: inline
In-Reply-To: <20201103172226.4278-2-yung-chuan.liao@linux.intel.com>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, vkoul@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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


--UJEqbsikIZBgizPR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 01:22:22AM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> The upcoming SDCA (SoundWire Device Class Audio) specification defines
> a hierarchical encoding to interface with Class-defined capabilities.

Vinod, any thoughts on this?

--UJEqbsikIZBgizPR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+8AxIACgkQJNaLcl1U
h9DSKAf7B0fvQvXeHixUX4SkhXfc30UeHn9weNSEZ/ZNa+k6GKgCHwd4ZGlscmkR
j5R1iSC+N1MKjIx48Ep2+N5PRWIRWDDFhqmD4e7iXSQFPMcfPPkM4kuvBaTZp32c
LL/8PA//RdwfXYnucWYyMnToshuzw4mOG1vr9zuTlKScC5/H9Ez0F6spXlSqtDhE
sb2yWyJJBkIQ2spXf/j7nAcNwn8en0ntW+TE94dWTnmnWeJiEwhi8WSs/C4nkPPN
8nNrhE8OiSyW5oR+H8mHc0vS2xct0QIo1OTPfqH2SwHbRYi2cX+4aPgCq9xGnOvw
5mXjdCXFxywXcrV682SlFoNVgFJp3A==
=3BdR
-----END PGP SIGNATURE-----

--UJEqbsikIZBgizPR--
