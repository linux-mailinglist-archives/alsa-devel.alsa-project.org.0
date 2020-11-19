Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6C42B9A91
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 19:27:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C78A171E;
	Thu, 19 Nov 2020 19:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C78A171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605810446;
	bh=k/L4GRVwFEJNK3OsJdzApB8Qk4ZHCBMjXzeFfhK/dpY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hKin53NAYaxpC4EGegxXHvaH/ZRuRi26j1KhfhJmeT6GXnXiCtcAKMmYhRN02Ugqx
	 b71LHTRrQqmzlF3YX9Rx2Y3FDqENzVm8+Mw8FbMEyzxxzYjnUCgHTPBH/lWoDB3tEz
	 qFef350nbye79+9RAuC3PvlzVUGuF7RFwxIIa4kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BE0AF8015A;
	Thu, 19 Nov 2020 19:25:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB77CF801ED; Thu, 19 Nov 2020 19:25:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B5AEF8015A
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 19:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B5AEF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uYiSds4w"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDBF024199;
 Thu, 19 Nov 2020 18:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605810347;
 bh=k/L4GRVwFEJNK3OsJdzApB8Qk4ZHCBMjXzeFfhK/dpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uYiSds4wbfE7IoUMznSuqNuU1O/0+pHoA8NAZ3gYwdrAKMQwrLq6ICUluI6ob/eQf
 2LnWPxnNIiLN7hrJz0zJ1sVR+g7iJwJNIoyIavsDscrma0+Xp23AXcNEticKKN4c9x
 HJp2JMS9gvTmpbqvCT6JrytIoCADNmDDQW/0OTys=
Date: Thu, 19 Nov 2020 18:25:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 13/14] ASoC: SOF: Intel: allow for coexistence between
 SOF and catpt drivers
Message-ID: <20201119182526.GI5554@sirena.org.uk>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <20201112223825.39765-14-pierre-louis.bossart@linux.intel.com>
 <20201119140650.GA37066@sirena.org.uk>
 <569716f0-a52f-e9af-dd83-5c622b8073d4@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SdaPbLtAangIkrMZ"
Content-Disposition: inline
In-Reply-To: <569716f0-a52f-e9af-dd83-5c622b8073d4@linux.intel.com>
X-Cookie: Chocolate chip.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Rander Wang <rander.wang@linux.intel.com>
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


--SdaPbLtAangIkrMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2020 at 11:52:22AM -0600, Pierre-Louis Bossart wrote:

> Humm, I just tried and it works fine for me on top of your for-5.11 branch.
> That error across the board seems weird, there's even a fall-back with a
> static inline if the Kconfig is not selected.

> Could it be that Patch3 was not applied somehow? That's where the prototype
> was added.

Looks like the patches got reordered because I had to manually add
Takashi's acks since he added some spaces which confused b4.

--SdaPbLtAangIkrMZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+2uJUACgkQJNaLcl1U
h9BPggf/SGtM8uNoGS3Zdx4HvDJMeleNQOXjxOT5EKN0x9PcsmfzM837ZkaUTe+8
EtJpV5RAO69wMYudiDFQlmY4ZFZHCDoxs0x6OClwnW8KBNWnd5jaWD93izSUOdi9
BC4rLT5BwTw9SPRui2qedsJtlA0nFJOFzfilhDJ4PinbwhLrU6Y4I13gZD8ziMwx
yvEYVGBp5g0G6QzEuiiNycFxOlFOzJCPs2GQSIc+cH5dffAN0JlhIElUtIwXNA8U
AXCzZEFRfiwBwngIDVwB6hHDp+xdiTRO+KKAE2mdfKLO1ZM7S08ct8dqazL/nZmx
06CJD4ID4kwovyh4W70IfWwVV9N4Ug==
=rlgS
-----END PGP SIGNATURE-----

--SdaPbLtAangIkrMZ--
