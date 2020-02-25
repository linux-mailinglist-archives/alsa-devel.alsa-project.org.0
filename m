Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132AA16B770
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 02:58:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA49168A;
	Tue, 25 Feb 2020 02:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA49168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582595928;
	bh=iODfL1aWc88u8Hsxgk8j1MfSUWefFU/wfZmWOWg1zKc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PtFkNRHqrFb1/IzeRQDDo/cUEs6gIzjtowHpm9jTGq35TJA0Zk+Xp8OPIGQD4IbL/
	 6k8D/dh9hz4/bPBZqJO28rrCPMtVGVrOM+bEov5X3XWbSz7EDqVpwvE6trHcSHfMzL
	 z6pdKFwRMRmBNcuXmNSCfg2UFuK4gT+jh3lP+XDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7592AF8016F;
	Tue, 25 Feb 2020 02:57:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DFA8F8014E; Tue, 25 Feb 2020 02:57:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDBBDF80137
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 02:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDBBDF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="D0sbq/gM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0tAHgHk+lk209YqCLneOkS69cnFDKhRz1Yh5vnGAZpQ=; b=D0sbq/gM1dlgFKQuf+LtgiYiu
 rCOtCbfvm9hL9vBAJ6m0IxnNOVUr95X5Vm1CV9W8raflfUWMv7tEhHCGdckO5L7jTx3nitgj+gj3C
 gumYzdXwbRsRUBmNrNY4aQznJOfzSqsVL3YtMWxZ0tq846CHurl/hIAGzd88lRHaWhCSQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1j6PT1-0000W5-LS; Tue, 25 Feb 2020 01:56:59 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id F3F51440052; Tue, 25 Feb 2020 01:56:58 +0000 (GMT)
Date: Tue, 25 Feb 2020 01:56:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH RFC v4 0/6] ASoC: Add Multi CPU DAI support
Message-ID: <20200225015658.GB21366@sirena.org.uk>
References: <20200120132928.25257-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline
In-Reply-To: <20200120132928.25257-1-yung-chuan.liao@linux.intel.com>
X-Cookie: It's all in the mind, ya know.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, bard.liao@intel.com
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


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2020 at 09:29:22PM +0800, Bard Liao wrote:
> As discussed in [1], ASoC core supports multi codec DAIs
> on a DAI link. However it does not do so for CPU DAIs.

Sorry, I didn't apply this at -rc1 like I intended to and now it
needs some rebasing - can you resend please?  My mistake, sorry.

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5UfuoACgkQJNaLcl1U
h9AyDQf9GKQNZyc9U/GKvU7bUMfnzIShrpa5y7EL8SaUNoOd2l544r2hnnji1O9E
s2lVi4kNpxA69qf4e7C1OOSAdkfiJwbqnYjt0R3+wUPlaIkrFoBkI9iR7j5eLEJh
bqnMaqxbUkQyMNA+ZKWqEYYau2X/2lTzKvdbzpMaCfYY2DH7n0fbP5fQAh3UCCqv
orlGUxjufcpYnwfyQjLbEU7q4khDUsbmwSJBZoFd1YXb3uGSQlttnFMaQFDIxfaE
ne9BXUBDOeOy+6hnFlPKYEjrTp+MxVltQCt8C2UV8tvlVEtSwCDx6S2yaiLCxjzm
oAT2PYfHg3Y9B1SGB2lFMOGfjIFESQ==
=cPf4
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
