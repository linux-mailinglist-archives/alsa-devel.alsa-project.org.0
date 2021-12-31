Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2058C482376
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Dec 2021 11:30:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F5E16B5;
	Fri, 31 Dec 2021 11:29:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F5E16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640946603;
	bh=DeOanhyW4lhrNrBBVdkpytOW3m2u0rxbjgnoadF6Uo4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WRhZbbYrK05ArvTlLNcKngOKS8oe2yrvhAGmJW5NbI8uxlQRdyv7N1DEd65I23xcC
	 hoIX28GGlRQ2eyAZ4MCBg6D0YI+Sx6UU474KOZG/bhmwDTNJFbKpc25dSMGJ+ibr/I
	 AHn13K1+FeVNIpmDOcD+zHO67ynivbk6cDjk36XA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A526FF802BE;
	Fri, 31 Dec 2021 11:28:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71443F8025A; Fri, 31 Dec 2021 11:28:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F32C4F80118
 for <alsa-devel@alsa-project.org>; Fri, 31 Dec 2021 11:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F32C4F80118
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1640946505770020962-webhooks-bot@alsa-project.org>
References: <1640946505770020962-webhooks-bot@alsa-project.org>
Subject: Support for TC-Helicon GoXLR Mini
Message-Id: <20211231102832.71443F8025A@alsa1.perex.cz>
Date: Fri, 31 Dec 2021 11:28:32 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #133 was edited from lm41:

Hi, many in the community had noticed that the Configuration for the GoXLR does not work for the GoXLR mini. https://www.tc-helicon.com/product.html?modelCode=P0DI7 Any ideas to get this to work as well? ref: #121

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/133
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
