Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F273C780EF9
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 17:20:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A4EE79;
	Fri, 18 Aug 2023 17:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A4EE79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692372027;
	bh=GxRTefvms6UPAI34nQuHOk5aDqqtgeQyGS2Dc1y2SWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NNTOz8B8wA6UJd/tbFbSRmdwedRjeO9bryqtYC7wU5nATXxIIDvF7Ks8BT+s//F0V
	 CzD84VzIjHoQO8tR/pEcTzDgIbk1ES71pshMXzTJePplDYbIKI1oQfXaMOkKGk8q7J
	 UOLchCsk7Ot3csBETh2KR2qT5bv7dULpWf/N97zo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42C07F801EB; Fri, 18 Aug 2023 17:19:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80942F8016D;
	Fri, 18 Aug 2023 17:19:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 550DEF801EB; Fri, 18 Aug 2023 17:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A14BF80027
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 17:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A14BF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sU/9VyQ3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DEF316799F;
	Fri, 18 Aug 2023 15:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067CDC433C7;
	Fri, 18 Aug 2023 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692371940;
	bh=GxRTefvms6UPAI34nQuHOk5aDqqtgeQyGS2Dc1y2SWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sU/9VyQ3x81U+aUA1zxO3Xol2oL/0v1xWFDIRJgr2RHb996ub+nm5e/BgBaR/sNwm
	 w9hZTfRzW6rx/sVx1FB/mtY/pkdVEc+cQKnAnl2OdmxvXbhT23UQz8QuqLGWb9EKpS
	 YB45U18YiQQuEP6Clg8zjDyo5tRyjKmEaP4qudDBS6jtuKm4zR/8TLMsNzVIISYVXh
	 ZGOiYEEyF43dGiaZ4v6+LKy/zzleizcdqv5PE0iMQOGFS+N8SWl47eQmzJLi6jmFRi
	 DM6nXPuplKDAtitz50/5O09YbMANQIDRKiMJ8Z+0e9zujLLwDjGlZk1Zx16bGUCGMx
	 TnYllbd8wrrAw==
Date: Fri, 18 Aug 2023 16:18:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	rander.wang@intel.com, guennadi.liakhovetski@linux.intel.com,
	yung-chuan.liao@linux.intel.com, regressions@leemhuis.info
Subject: Re: [PATCH] ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during
 stop
Message-ID: <8428b13b-50c4-4db5-8de9-7a9b165f6254@sirena.org.uk>
References: <20230808110627.32375-1-peter.ujfalusi@linux.intel.com>
 <169151742693.78353.2991484643013989552.b4-ty@kernel.org>
 <b23c2ef1-7c9f-5eca-f61d-6f6994226ddc@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k13XKuDncwfGPUGw"
Content-Disposition: inline
In-Reply-To: <b23c2ef1-7c9f-5eca-f61d-6f6994226ddc@perex.cz>
X-Cookie: Your aim is high and to the right.
Message-ID-Hash: PT5XW5ITQBA6I2T75LMYEWFPBA2QKQUL
X-Message-ID-Hash: PT5XW5ITQBA6I2T75LMYEWFPBA2QKQUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PT5XW5ITQBA6I2T75LMYEWFPBA2QKQUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--k13XKuDncwfGPUGw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 05:08:35PM +0200, Jaroslav Kysela wrote:
> On 08. 08. 23 19:57, Mark Brown wrote:

> > [1/1] ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during stop
> >        commit: 90219f1bd273055f1dc1d7bdc0965755b992c045

> 	if it's not late, this patch should be also applied to the 6.5 tree. It
> seems that many new laptops are affected (sound may be really weird when an
> underrun occurs on those devices and users are not really happy).

It was applied for 6.5, the reports always say for-next due to
difficulties with serieses which mix fixes and new development.

--k13XKuDncwfGPUGw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTfi90ACgkQJNaLcl1U
h9BCEwf/cdDLUCJ/TOK3sF7KNBeR62V5dZZJzpWMH4vK8phjkl+vhto5Ktjtd8KQ
FkPNYbBufMn5KsPkdt+qtIwkEmb6UUCX148b/ot5TFi4K36DWIEhNUtr+jFXP+1J
Wo1KFPjejh5xWVBjNhpsxWNKke74liX3qM45VuG3Ptm4fEUPCTJgqlNnfJXOY9tq
Mg96fhA/qYsrChBsXCh55kh6qen/Lrfzis9rO02J3jgWMMmitEIxQ8ACSDLYZqR1
QfCYH0U9DyCebLAmu/P62vR4w1nJ2ntqwivuAUl/0Pvom8n4H/4TmcE6rnOnRsEH
L8IIks5b+9qYQZJsQC0sw0aTpmnuVw==
=e4T7
-----END PGP SIGNATURE-----

--k13XKuDncwfGPUGw--
