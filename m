Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AFD842892
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 17:00:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00123EBE;
	Tue, 30 Jan 2024 17:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00123EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706630457;
	bh=b8i2Ikqa5Isp1hTL6r1iKRXe/yBNaJv7nEw/sg4+Fto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MI2JNpcpZjkfZdbW4O3a8P8I2vjkis2bKnP8f0mFPM5B8zfDuv8BVdkabaO90BnIg
	 mggu+k6Jb9QjZmv51DKC8lyQn5XKPLfckumlwsDdEIEfiNLwUqxqE/cMNUTRf2FZDu
	 PCtBXROau9Wh0WB5lyiGeW8bkyZLMJ0n/V3u+9nw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6EAAF80587; Tue, 30 Jan 2024 17:00:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53F20F8057D;
	Tue, 30 Jan 2024 17:00:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27F70F8055C; Tue, 30 Jan 2024 17:00:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C180F80548
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 17:00:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C180F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=noBBIrpV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54D7D60DCA;
	Tue, 30 Jan 2024 16:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C9BC433C7;
	Tue, 30 Jan 2024 16:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706630417;
	bh=b8i2Ikqa5Isp1hTL6r1iKRXe/yBNaJv7nEw/sg4+Fto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noBBIrpVpUGmdyuqTZlL9IsgEuy8Jh9xZUF1EMV/uqKDB7q2R1v5PAYP4iUUexVAb
	 yOQI0dT+PxwTgmrAaP7v/eBV/IYZ9Im8C1XV5xfntJEmj7wJeX3ITgfZsM6BaIg+54
	 IUgpXo1/vuAYWDFo6ajtXD25wsNNaUSvbqTlppGS3obJC5s3TfVrZ0XX8i9AJI7i/E
	 uJy63vEf5cfd+N7+QeXHjzyZJlMJWZfzXq82atkn6ytzjHByzzv6trtZgxUwBL8/3K
	 am+pMz62BDA/c2W3rKZ4TxsgKhVfLxF7pAG8iSdva3BttNUxkTYb+I1aaKou7NojXd
	 IKLkrrXon7TGg==
Date: Tue, 30 Jan 2024 21:30:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 03/13] soundwire: amd: refactor amd soundwire manager
 device node creation
Message-ID: <ZbkdDUh8hJ4WTQ_W@matsya>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
 <20240129055147.1493853-4-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129055147.1493853-4-Vijendar.Mukunda@amd.com>
Message-ID-Hash: VULIDMHCF6CLP4ULEQYDGZWPLLXATWO6
X-Message-ID-Hash: VULIDMHCF6CLP4ULEQYDGZWPLLXATWO6
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VULIDMHCF6CLP4ULEQYDGZWPLLXATWO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29-01-24, 11:21, Vijendar Mukunda wrote:
> Refactor amd SoundWire manager device node creation logic and implement
> generic functions to have a common functionality for SoundWire manager
> platform device creation, start and exit sequence for both legacy(NO DSP)
> and SOF stack for AMD platforms. These functions will be invoked from
> legacy and SOF stack.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
