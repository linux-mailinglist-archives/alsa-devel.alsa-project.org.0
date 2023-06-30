Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 227FE74575F
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 10:34:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C221851;
	Mon,  3 Jul 2023 10:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C221851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688373253;
	bh=mKsth7EbgkktN+M1x6jv9ltsVnjMGds9Bu4btwXjhuc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CbEqmuwvxma4DOK7zuhxNHXxgewoskOxSVsilDdAs5ZYtkMmmoe5d1t39U4AjGufF
	 ZEE6hECP+GpGL8xx3YQjn/Rrp0oqgl54fDPTbwwXSvZXihFGwTyMPt5+yxYqd1OMHG
	 OIhKR3HgzukiZ2J6HOCAI850skwKhdquR5n5gwz4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFC5AF80570; Mon,  3 Jul 2023 10:32:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 180BBF8055C;
	Mon,  3 Jul 2023 10:32:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3081AF80534; Fri, 30 Jun 2023 16:27:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A8F6BF80212
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 16:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F6BF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i+wLH/8a
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4888361762;
	Fri, 30 Jun 2023 14:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB939C433CB;
	Fri, 30 Jun 2023 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688135238;
	bh=mKsth7EbgkktN+M1x6jv9ltsVnjMGds9Bu4btwXjhuc=;
	h=From:To:Cc:Subject:Date:From;
	b=i+wLH/8aztVS6laPB94qFGyj49FNfrCnK1P4cZtv8bt+cErbMbT6EHOinqk6S6IG2
	 A0oRHVrLT/N75GT2CeKVImUVz0vCZ/M1tbxy8QAjZCGkxeq470Q580o4d8Hmh2wGL5
	 9OXmakeNK9A6lNP5GUUwBfS7vRKWDjlC3JZK3oZ1+iX/qKxXaXWu86FXn0LZfgOOiH
	 M/ZkTqq1aVOJZ8sR/7bY52YvtrtEmPlr4UO9abheW48h+YJWz/nc8KrVyxbkBPPXfn
	 LRhrTpiFBv3bmSUVeStZxhGM1xdFFt16ASmQvxQInsbznK+mmJBoMegKXUj6njSzJd
	 kq8C5/9LfAVww==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qFF5o-0001O3-FO; Fri, 30 Jun 2023 16:27:25 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/5] ASoC: codecs: wcd938x/wcd934x: loglevel fix and cleanups
Date: Fri, 30 Jun 2023 16:27:12 +0200
Message-Id: <20230630142717.5314-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KZAS33HNVLO4XLCIYBS6CIEIZO5GIBUY
X-Message-ID-Hash: KZAS33HNVLO4XLCIYBS6CIEIZO5GIBUY
X-Mailman-Approved-At: Mon, 03 Jul 2023 08:32:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZAS33HNVLO4XLCIYBS6CIEIZO5GIBUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When investigating a race in the wcd938x driver I noticed that the MBHC
impedance measurements where printed at error loglevel which is clearly
wrong.

Fix that, and clean up the logging somewhat by using dev_printk() and
addressing some style issues.

Included are also two patches that drop the bogus inline keywords from
the functions involved.

Johan


Johan Hovold (5):
  ASoC: codecs: wcd938x: fix mbhc impedance loglevel
  ASoC: codecs: wcd938x: drop inline keywords
  ASoC: codecs: wcd938x: use dev_printk() for impedance logging
  ASoC: codecs: wcd934x: demote impedance printk loglevel
  ASoC: codecs: wcd934x: drop inline keywords

 sound/soc/codecs/wcd934x.c |  8 ++++----
 sound/soc/codecs/wcd938x.c | 17 +++++++++--------
 2 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.39.3

