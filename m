Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5C4713414
	for <lists+alsa-devel@lfdr.de>; Sat, 27 May 2023 12:41:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABB4A1FC;
	Sat, 27 May 2023 12:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABB4A1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685184085;
	bh=JNsRIsRjL/8M1yvZ7uGK5oXUYuFpKrOFRM3AqzsXLYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bshmhTqk1HGlKLiqTixtdzniNRAQEVi/VLpHgHO4dhJRdyefhktRruY9BFIZ3WXR7
	 WRpjNtEA0pvIeCHxE0ddWk5bmM8jVWS5Dg+o3ER66bl0ED5Ua8GvRXoD2d5GxBWRBd
	 b/uAmGmEBuyGQstTd4f1LxXTQdaWp7kmXfcYqdc4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 645E9F80549; Sat, 27 May 2023 12:40:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 141E3F8024E;
	Sat, 27 May 2023 12:40:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DE95F80249; Sat, 27 May 2023 12:38:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 306C2F80053
	for <alsa-devel@alsa-project.org>; Sat, 27 May 2023 12:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 306C2F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W5miuFCM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F324560C6D;
	Sat, 27 May 2023 10:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EE6C433D2;
	Sat, 27 May 2023 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685183888;
	bh=JNsRIsRjL/8M1yvZ7uGK5oXUYuFpKrOFRM3AqzsXLYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5miuFCM+/3je+DB5zjAJcaNeWueZc60AAV1IKmvNtbTbjaYJmGl0irXHeF9CV40L
	 UBDPdzjzJTenGyR2CEgdLZXIu/f9JV2oxtdstDpaLZc2h4F9Ij0aq/IZtUqCrniCJK
	 7pbkIEhwG8ZBS4BNjloK6qwvoSoBwcn/QVAxt8bvqGOVwNqkJl9gY3NmxN8jaz9ACn
	 Z9pt66qg+nxdseTn7YIQPcA3MKlOony+SbVU1u/cHHWsT/1UpMDzKEkXoYLzTdG747
	 qZWEWD75V2lYnloxdAfMz3Dxb5kf0ixNHlLsCm+KQkNC8qiWhIIQiYKrFaqvwnHjFY
	 DRSULoWRSWjnA==
Date: Sat, 27 May 2023 16:08:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH] soundwire: dmi-quirks: add new mapping for HP Spectre
 x360
Message-ID: <ZHHdjJ+XyZzVYzX2@matsya>
References: <20230515074859.3097-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515074859.3097-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: YWMLVBKQPYXNBLSR2AWJILFRPHYZ3HUN
X-Message-ID-Hash: YWMLVBKQPYXNBLSR2AWJILFRPHYZ3HUN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWMLVBKQPYXNBLSR2AWJILFRPHYZ3HUN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15-05-23, 15:48, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> A BIOS/DMI update seems to have broken some devices, let's add a new
> mapping.

Applied, thanks

-- 
~Vinod
