Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1332653EC0
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 12:10:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA29E3DB3;
	Thu, 22 Dec 2022 12:09:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA29E3DB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671707419;
	bh=jsBkgd8YioFuFRglOCm1xBbNeS+RnhbdiBDIPfHEqn0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z2Q5spv73n1EGYZHkj0XCWc2jA018eUyMLQEI/NW2iR6v7jrheGsiRwyVrYgYOKNM
	 8Ls+MZGZDHANGdePbAhvCnTgZXpW0A5shsv9yDKHwrE5wzQHPwB1oMYP0uEFVh+U5g
	 rzGlkt+I7J7Ey/H8nYdeAaa7FiJVg00lt7VVpe3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DC23F8025F;
	Thu, 22 Dec 2022 12:09:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3D6FF8026D; Thu, 22 Dec 2022 12:09:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6D2E6F80022
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 12:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D2E6F80022
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1671707364615823030-webhooks-bot@alsa-project.org>
References: <1671707364615823030-webhooks-bot@alsa-project.org>
Subject: nhlt ssp aux data and blob ver 1.5
Message-Id: <20221222110926.E3D6FF8026D@alsa1.perex.cz>
Date: Thu, 22 Dec 2022 12:09:26 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

alsa-project/alsa-utils pull request #184 was opened from juimonen:

Add support in nhlt plugin for:
- ssp blob ver 1.5
- ssp auxiliary data

Request URL   : https://github.com/alsa-project/alsa-utils/pull/184
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/184.patch
Repository URL: https://github.com/alsa-project/alsa-utils
