Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 718205F5517
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Oct 2022 15:12:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4B9E167F;
	Wed,  5 Oct 2022 15:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4B9E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664975557;
	bh=Yfqg3iN/KcO5o11mKPsc7n9e5M13lqQK4JPY4mWh0qA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZkgIRw3qD5qDmywSAQIWHurEMRJEfMVCtinyplK5sgRxTT2K4BYo4aa7QFGcra2I
	 FVNpMYHc0guVa7mxlkh9EubBQtqpHaVvPEgI0q9U3NHIYsC+7k1Kks5RGHQ/jsUibn
	 kzbYZsGOuRPSRR99LRHS3T+B+orC5DxQ1nU+2K7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35ED9F800BF;
	Wed,  5 Oct 2022 15:11:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48A49F801F7; Wed,  5 Oct 2022 15:11:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_FAIL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 565F9F800BF
 for <alsa-devel@alsa-project.org>; Wed,  5 Oct 2022 15:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 565F9F800BF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1664975493385212898-webhooks-bot@alsa-project.org>
References: <1664975493385212898-webhooks-bot@alsa-project.org>
Subject: Add support for getting list of supported codecs
Message-Id: <20221005131140.48A49F801F7@alsa1.perex.cz>
Date: Wed,  5 Oct 2022 15:11:40 +0200 (CEST)
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

alsa-project/tinycompress pull request #16 was edited from SanchayanMaity:

Right now, there is no way to expose a list of codecs from `tinycompress`. While one could theoretically call `is_codec_supported` multiple times in an application to check against a list of codecs, an API would make it easy to enumerate supported codecs. The IOCTL `SNDRV_COMPRESS_GET_CAPS` after all already exists.

Our use case is Pipewire where we would like the compressed sink node to advertise only codecs supported by the underlying hardware. So far we were just advertising the complete list of codecs and let node linking fail at runtime based on result from `is_codec_supported`.

Request URL   : https://github.com/alsa-project/tinycompress/pull/16
Patch URL     : https://github.com/alsa-project/tinycompress/pull/16.patch
Repository URL: https://github.com/alsa-project/tinycompress
