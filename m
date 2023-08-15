Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F3277CDE3
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 16:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFA2D829;
	Tue, 15 Aug 2023 16:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFA2D829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692109004;
	bh=Pvw0knH5aK1JT76Gogw5tdklLV3FIclvxoJl43eExcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CiZXru8rHAQq5jTukIRhWrIjSxviC5l2CbyfmisrK+urngBTK0nSOp2J58/ZCIYQq
	 23KrI/asUIpLw6EiNIZjh9+4ZBfJzNoKVwVVxZUGxlzXL5cnAuERDlgD7Spw0K7D2X
	 YFxOB11ZG78S4XoHBf33N0MDMwEqAotz88v8FfaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A311F80254; Tue, 15 Aug 2023 16:15:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B66F4F8016A;
	Tue, 15 Aug 2023 16:15:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 164C5F8016D; Tue, 15 Aug 2023 16:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55AB1F80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 16:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55AB1F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HvklSn5g
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D971462E69;
	Tue, 15 Aug 2023 14:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFD7C433C7;
	Tue, 15 Aug 2023 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692108944;
	bh=Pvw0knH5aK1JT76Gogw5tdklLV3FIclvxoJl43eExcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HvklSn5g0JGJd5ghvIpMvQuV6qnVfCz3qsGVAi+1A4rAE6xlGgw5yHuqiKwTKI84v
	 Nhg+POoqt+u9pWOPVFtKcgc0v8Kk6aU9w2FW5fogV7q4fV/eRPkB/SLnKrWpxh1ufd
	 knLpxqm8LtSFVn+ejy1lJKTzkHTlyfbrNVyKKiOad3eFTMZVz6bOSTLeXhE20K3Bq2
	 V5mIRvBq7/QiOD7kWtq7DYwXpIwa4ZdnTtJ4y0BRb7jniiQiTFtasPXL2hG4ohqBg5
	 IWszMUGsiVF0YdlqWcOJV8LfMlLAbu2bNv3ayhTo7ylUQ1uZxYeBmkGyhLbs69zyd7
	 epSohgoPyeMjg==
Date: Tue, 15 Aug 2023 07:15:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt5677: fix -Wvoid-pointer-to-enum-cast warning
Message-ID: <20230815141541.GA4129040@dev-arch.thelio-3990X>
References: 
 <20230814-void-sound-soc-codecs-rt5677-v1-1-5c468c60fa37@google.com>
 <94c059a6-07bf-4887-8c67-b8b0724baa49@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94c059a6-07bf-4887-8c67-b8b0724baa49@sirena.org.uk>
Message-ID-Hash: US342CMIQKCMFCMQJV3SCYOJFZ2UQHLX
X-Message-ID-Hash: US342CMIQKCMFCMQJV3SCYOJFZ2UQHLX
X-MailFrom: nathan@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/US342CMIQKCMFCMQJV3SCYOJFZ2UQHLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 15, 2023 at 01:54:40PM +0100, Mark Brown wrote:
> On Mon, Aug 14, 2023 at 09:58:56PM +0000, Justin Stitt wrote:
> > `match_id->data` is a void* and as such is being truncated when cast to
> > `enum rt5677_type` which is only int-width.
> 
> This doesn't apply against current code, please check and resend.

It looks like Andy fixed this warning as part of the refactoring to
device_get_match_data():

https://git.kernel.org/broonie/sound/c/043bb9c012ee7d092a477159cc66dbdf62fd2666

Cheers,
Nathan
