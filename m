Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E1F770331
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 16:35:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83FCE7F8;
	Fri,  4 Aug 2023 16:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83FCE7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691159752;
	bh=+lJIRiFGJ08uXie+J5FweklQWmwi3zqjFBtJLkhC33Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CH3V2Sra2JTt3xJi8GgQFV8oGu5zlHqRLiYiuuDb06ztPigHJ27HYnslokKoOAMNB
	 lwj0due0aJDIUa1/I0qQ2FEQXVlzcv/2yz1uplTNF29mJ3gvC1N7nk3DFmK6Vnb3Os
	 soGdzvG+IhojrlcwD6S2LLlbva0zPFZ/iMbjHHNE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3EBDF801D5; Fri,  4 Aug 2023 16:35:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FB04F801D5;
	Fri,  4 Aug 2023 16:35:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E156AF8025A; Fri,  4 Aug 2023 16:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8B65F8016D;
	Fri,  4 Aug 2023 16:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8B65F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RsYOuD5D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D24362054;
	Fri,  4 Aug 2023 14:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12B7C433C8;
	Fri,  4 Aug 2023 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691159676;
	bh=+lJIRiFGJ08uXie+J5FweklQWmwi3zqjFBtJLkhC33Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsYOuD5DMBy/zqAW9uoBt4tEmi7FJih3SEkC7t4eWS3kYe368kJNeoYF5qvI51KmM
	 dM2aqKA4j0nqyg98kSqfDpn/iEZ/ruZ7HTvNiKEH+4xMZVdgZSWmub9EvWCKUC0XY/
	 3VwW6MyI9boz0rZd/wekvos81ezp+ZLjh4dWIw/T84RFXN5eE9F9MIfhG8ggkGLLuu
	 BO0BH2IHLTl7Yg81DgbGS/h3+4hTtKSYttzUp9C3ODKZynJUNP7PcnFQ+pT+H6Or0m
	 KpVS2Q85hy79VR0V4rqKalxLlwp1mV+ZK/GDtcYkt2/YdYYgADzMkrMAo07QimArWu
	 1M8zK18wuYrkA==
Date: Fri, 4 Aug 2023 15:34:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Move binding to display driver outside
 of deferred probe
Message-ID: <901374fd-bd51-4e47-a52d-f584fe495bf8@sirena.org.uk>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <87r0oohyea.wl-tiwai@suse.de>
 <ec653abc-f2f8-8a9d-4b8a-ea9d985d32fe@linux.intel.com>
 <f6efb6f9-11ae-e901-f2a5-a4ef94590290@linux.intel.com>
 <2719a8fc-d2e5-f499-ac4d-cf322941526c@linux.intel.com>
 <383ebe0e-e333-4b6e-8688-98a20977d03c@sirena.org.uk>
 <6469f503-df51-f25f-28ec-6ade51fda5a6@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B27ZSNrZKXdW/Smm"
Content-Disposition: inline
In-Reply-To: <6469f503-df51-f25f-28ec-6ade51fda5a6@linux.intel.com>
X-Cookie: I'm hungry, time to eat lunch.
Message-ID-Hash: DIBSCGFGUYOLGZORKHNV3PANTTK7QB6K
X-Message-ID-Hash: DIBSCGFGUYOLGZORKHNV3PANTTK7QB6K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DIBSCGFGUYOLGZORKHNV3PANTTK7QB6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--B27ZSNrZKXdW/Smm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 04, 2023 at 04:31:21PM +0200, Maarten Lankhorst wrote:
> Den 2023-08-04 kl. 13:59, skrev Mark Brown:

> > > On 2023-08-01 18:32, Pierre-Louis Bossart wrote:
> > > This mail can be applied with git am -c.
> > > ------8<---------

> > > Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> > Don't do this, it breaks my automation and means I very nearly just
> > skipped the patch entirely since it looked like the middle of some x86
> > discussion.

> Yeah, it's replacing the patch from earlier. I can resend, but means having
> to add all acks, r-b'd, etc. :)

*Defintely* do not do that:

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

> If you have scripts that do that, all the better.

If you're using b4 then b4 trailers --update.

--B27ZSNrZKXdW/Smm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTNDHUACgkQJNaLcl1U
h9DSwwgAgZMCpAEOPlZuVKwW4SpV9KXaqHGhWHV0wyr1wRoQTthyxEf/mZ8kSCj1
5ilEokAZ76LDBq1Yo4cqvMphyvhaGEob9hMrEgTcE2420xfab2yuu+cQFe9Kpl/B
mDG3PMdc1m3M9zdcL4r1KXwpjb18TU0IjIp0jJXVK79lfHZoalQHjd7Q86AKckQb
0nwlypK+cLFYNJ/bfaOGe8yt9f+WTsKv3BqlxJqQ0r3oSujQ4M36+P+NHZF/q20a
fS2J/ZgmBIJnef4HJD/Liciiv1KPomMW/ZDbOQFm1l5XZFXZTidECm3ojpNqmzIk
lzYEqfLxGcg6NjAhLw7wIyZrRT3PhA==
=zsxb
-----END PGP SIGNATURE-----

--B27ZSNrZKXdW/Smm--
