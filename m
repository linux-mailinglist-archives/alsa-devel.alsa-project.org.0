Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBE2923C57
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2024 13:26:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1692021A1;
	Tue,  2 Jul 2024 13:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1692021A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719919560;
	bh=IGTDRo6K0tNvKcrV9mV4TjWGqTPF30WgvwuJZWZo89I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mtmFAF8AWxe9wH/DJszdYxr6QhXuRRGGQqugvuOZerjs2iiIUaoHiTDPuHZxw5NhN
	 Xuzrr/NSs7P4W/o1Rcs0iOe3JbUoB2ekBhTX3c9QMvOrkeJvVaIr8I8GlUv4rmwDAQ
	 rMWiAfIfRqQlpzvtigmw4qtGhlQxq2HBKesIRkaU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A987F805B4; Tue,  2 Jul 2024 13:25:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 267ADF805AF;
	Tue,  2 Jul 2024 13:25:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1B2FF8025E; Tue,  2 Jul 2024 13:25:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9BD2F800FA
	for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2024 13:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9BD2F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PKZ/1wY7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FB3D61988;
	Tue,  2 Jul 2024 11:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137CAC116B1;
	Tue,  2 Jul 2024 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719919515;
	bh=IGTDRo6K0tNvKcrV9mV4TjWGqTPF30WgvwuJZWZo89I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PKZ/1wY7tvnQaI+Hw0HCd/2Y7JR21vFGvwILD5Mjf+tLfWdzWegNWShdC2RK462CS
	 LCBQCsYfsFCCIYdO241a/ALbsMALzY2tURPNlP/lAkEBnirO8KdsDwyURmEk5BXKtr
	 egNi79vCTPhUtOTuLCzpjoxoEu5kixrTXWCtgmN6QbRCidfAN5CsCg35VYBO961Utl
	 156nS5zOT4irehy7MELJfyJpkOEOZNcEDkgXhmrReaYHO7sngPrjNwNQJ13c4MKZ60
	 HeGsvafdYiZIMkna5wWGG3+KZ3lDQ9qN3Ftu5sWAKBWupfYA7rIEVIPSj88wpHmIKK
	 Cy8vP8shX24GQ==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240618-soundwire-port-map-v1-1-9644e5545b9b@linaro.org>
References: <20240618-soundwire-port-map-v1-1-9644e5545b9b@linaro.org>
Subject: Re: [PATCH] drivers:soundwire: qcom: cleanup port maask
 calculations
Message-Id: <171991951268.679506.15436884721168000207.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 16:55:12 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
Message-ID-Hash: RPBVA4P3PKVOYZXLE3VLVEIYHRPYIAV3
X-Message-ID-Hash: RPBVA4P3PKVOYZXLE3VLVEIYHRPYIAV3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPBVA4P3PKVOYZXLE3VLVEIYHRPYIAV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 18 Jun 2024 14:55:15 +0100, Srinivas Kandagatla wrote:
> Cleanup the port map calculations, existing masks of having separate
> masks for in and out ports is not really required.
> Having a single mask for all the ports in the controller is simple and
> cuts of some unnecessary code.
> 
> 

Applied, thanks!

[1/1] drivers:soundwire: qcom: cleanup port maask calculations
      commit: 518aee32c551d2f7d1e577f63df6dfcc80259b50

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>

