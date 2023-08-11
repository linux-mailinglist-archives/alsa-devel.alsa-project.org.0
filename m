Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672417787DB
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 09:09:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FF79822;
	Fri, 11 Aug 2023 09:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FF79822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691737786;
	bh=9t9OXLwolWaZM2qZYGvnVDgliT55fV8UASsB6brD4gc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NarsfzCoP2moRhBRWFK49BKqlSx0kpPBpXpDTw4rdBP0oKfX88UmrnojWsLQn6zMn
	 ysiHY/2Qwvmflm8sB5KxkfMTJUoXDpowNEO+QOzF5x5H2YI5kKR+MzlOA5HaiPG3/T
	 eMZxr8unkOmn6288+XTPNkdv7683hc43Ra552uhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98BD2F8055B; Fri, 11 Aug 2023 09:08:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86763F80166;
	Fri, 11 Aug 2023 09:08:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E24EDF801EB; Fri, 11 Aug 2023 09:07:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3829DF800F4
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 09:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3829DF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZHAhG/Bq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3B1864413;
	Fri, 11 Aug 2023 07:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A73EC433C7;
	Fri, 11 Aug 2023 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691737609;
	bh=9t9OXLwolWaZM2qZYGvnVDgliT55fV8UASsB6brD4gc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZHAhG/Bqk5JY8S79U5V9cV8xv52fYcY10p51wM7MvOm8x78u2z7A6RDzZO8sTBWDW
	 gn28BZIQ2Bld0akDFrR6wE7luCCx6NfRT3fMXAVCSI8cMhH/IEoGnt3oWhQPExwvOv
	 oA1CmXLazKqVNqZmcW+CYALhLfINK3RLBnTRQz8QTmIDaCAz4+uk2GF8bJtlOMP07r
	 hSx9ikq6Kub2Dm6hPJChtEDMRnIc/F5NpX+L3cruv3CJNBwEU5FJVFXRzt6xu/yvfB
	 2vnJbBjtYtcOcs2/Np1rC/dSHV5H10kfMvSNEeH1omWfGgsakki6wcDXdMRhkzzftE
	 VvxZDPVrq1e2g==
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
In-Reply-To: <20230803065220.3823269-1-yung-chuan.liao@linux.intel.com>
References: <20230803065220.3823269-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] soundwire: improve pm_runtime handling
Message-Id: <169173760795.104525.2454658180185831669.b4-ty@kernel.org>
Date: Fri, 11 Aug 2023 08:06:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: HJXIRWIH4EOJYQS56BIRSMPIM2PYBNZV
X-Message-ID-Hash: HJXIRWIH4EOJYQS56BIRSMPIM2PYBNZV
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJXIRWIH4EOJYQS56BIRSMPIM2PYBNZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 03 Aug 2023 14:52:18 +0800, Bard Liao wrote:
> This patchset improves the pm_runtime behavior in rare corner cases
> identified by the Intel CI in the last 6 months.
> 
> a) in stress-tests, it's not uncommon to see the following type of
> warnings when the codec reports as ATTACHED
> 
>     "rt711 sdw:0:025d:0711:00: runtime PM trying to activate child device
>     sdw:0:025d:0711:00 but parent (sdw-master-0) is not active"
> 
> [...]

Applied, thanks!

[1/2] soundwire: intel_auxdevice: enable pm_runtime earlier on startup
      commit: 3d71f43f8a59a62c6ab832d4e73a69bae22e13b7
[2/2] soundWire: intel_auxdevice: resume 'sdw-master' on startup and system resume
      commit: f9031288110589c8f565683a182f194110338d65

Best regards,
-- 
~Vinod


