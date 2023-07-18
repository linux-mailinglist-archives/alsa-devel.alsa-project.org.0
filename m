Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987B757F24
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33EC6112;
	Tue, 18 Jul 2023 16:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33EC6112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689644;
	bh=ItUq2wJPk7Akcakns/n+ij2jxWHUnqGkiyYIs9KHoLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rjy/eIziiuo95fg2TUsp3kmrOxMoB9+0TRapqWGCy+1S/O4+EzxnW0PuT7sCUvatW
	 1+xpqpVNF7kVaDqTfzLOtQSfc91+X6YIO+dzJG0s7Ts/IBH4y3Zl0RX+0yMqdpXw8E
	 7lEfVLKXXVnVF/dnKpzjMCMFr7VqSILqINCEgXXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F6D6F8032D; Tue, 18 Jul 2023 16:12:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9504F8027B;
	Tue, 18 Jul 2023 16:12:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63AFEF8027B; Tue, 18 Jul 2023 16:12:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04376F800D2;
	Tue, 18 Jul 2023 16:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04376F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gLNQK+lS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C93361561;
	Tue, 18 Jul 2023 14:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2250C433C8;
	Tue, 18 Jul 2023 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689689557;
	bh=ItUq2wJPk7Akcakns/n+ij2jxWHUnqGkiyYIs9KHoLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLNQK+lS1sNg/+kSy5JJGKrcpuI7mTkFj/EihBUQ7Ev/u7ZgrkWv56uFCDoei/reY
	 Dyo3YnJ7GTKWqNnF5I7YdF1KxK75qJorR/Ohobbh7aR51hopT8+HzMPUoIyxSESTGD
	 CiQV2jxDeIwh+JFUDQ5Cxf1hVc/JnyCZFxO++YuJcdj+Ql/SebnCpERJTf/tPmN9zZ
	 jVxODuUp+KJ5XxfbNbjRUb8iL5i8JnHh8rvWj6VdiCHm1TY4GfAE+bLlc8Yvssdhew
	 /Pv0XBHaxSdVEu3jcFCtqROLxHgkIak7OeRA8KDpQ54CySdtREBIwuR+HebFdfvQwA
	 82ui3K7zMm+5g==
Date: Tue, 18 Jul 2023 15:12:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH 4/7] ASoC: Intel: Skylake: Move snd_hdac_i915_init to
 before probe_work.
Message-ID: <a240adcc-5677-47d1-a2d0-97a6ddf3c274@sirena.org.uk>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-5-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JHLFpblRHBWMJVrT"
Content-Disposition: inline
In-Reply-To: <20230718084522.116952-5-maarten.lankhorst@linux.intel.com>
X-Cookie: Nothing happens.
Message-ID-Hash: O33DVZCOKNDHWX76C33JG6UC4IR42KKC
X-Message-ID-Hash: O33DVZCOKNDHWX76C33JG6UC4IR42KKC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O33DVZCOKNDHWX76C33JG6UC4IR42KKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--JHLFpblRHBWMJVrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 10:45:19AM +0200, Maarten Lankhorst wrote:
> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue. It's likely the whole workqueue
> can be destroyed, but I don't have the means to test this.

Acked-by: Mark Brown <broonie@kernel.org>

--JHLFpblRHBWMJVrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS2nc4ACgkQJNaLcl1U
h9DtFQf/Y0/WSyV0O60ASj8M/EcrXlSr1taBqtfT4vGV0rza+nJrvCXa9j5TQeeo
psGjl3xB53ggRY1m6fqAGiuhCxSBg/n3EgKq2Oj2U9NIao+JOJvN89d/1c4eLStR
oAmuFgRat5PX76xi1h7EeWcz73gjLNt3DTuPCMUqPHxsHrvcoCHoLepL9wG1aLRf
GK/tJ+jfVu3RdLOZ2vjFMm6tegsU/26n7o9KtRPQ31XejBRYVIyaLeK5+k/KEUg6
ITfLDlXhYnH1XpllbzTgNjn8zHLuoZYsPeJ8K3ht+V2durjPE6aM6rxUO7G8j+s8
zghKJSYRgJjoEX9nARrf7eiPEAPPYg==
=tUzJ
-----END PGP SIGNATURE-----

--JHLFpblRHBWMJVrT--
