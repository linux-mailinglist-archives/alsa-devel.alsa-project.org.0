Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E51D2558F81
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 06:11:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 340A818BD;
	Fri, 24 Jun 2022 06:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 340A818BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656043899;
	bh=y8pGtG3PuxLBFVfEwrqIWIDSfEHSUOMrbwQEwPV/guE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eXLgETNAVRhPtRAC+0IdBCl4oJ8m1BpTeijPgJzeCqz6PETgUmz4gL4pzP6E7pG4b
	 5ilUvPagJk+ffIS2p9ZqO058FN0wuXu8PQF291D3iQ9sD0KOKdbv0wbfE/xnLu7UWX
	 0Cb4CGfluVf8d2X5re+0ffj1EYpgCePzL/V0P2eI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FC8F80107;
	Fri, 24 Jun 2022 06:10:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D481F80139; Fri, 24 Jun 2022 06:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D201BF80107
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 06:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D201BF80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656043832025093079-webhooks-bot@alsa-project.org>
References: <1656043832025093079-webhooks-bot@alsa-project.org>
Subject: UCM for Behringer UMC204HD broken
Message-Id: <20220624041039.3D481F80139@alsa1.perex.cz>
Date: Fri, 24 Jun 2022 06:10:39 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #177 was opened from gregory112:

This is related: [https://github.com/alsa-project/alsa-ucm-conf/pull/128](https://github.com/alsa-project/alsa-ucm-conf/pull/128).
I came from this issue I filed in Pipewire: [https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2471](https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2471).

So previously a while back, Behringer UMC204HD was detected as a single stereo input channel. This sound card has two inputs. However, just recently, the channel was separated into two mono channels, which was perfect. However, with the most recent update (I don't know if it's pipewire, pipewire-alsa, alsa-card-profiles, or alsa-ucm), it reverted back into the stereo single input (left/right) mode. What can I do to bring back the previous correct settings (apart from the bugs I filed in Pipewire)? I did not modify any ALSA UCM files.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/177
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
