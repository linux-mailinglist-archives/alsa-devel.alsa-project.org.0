Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4305E2CF1F5
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 17:33:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD6A91831;
	Fri,  4 Dec 2020 17:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD6A91831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607099598;
	bh=UYYrLs0MH8di82U3gRXZSu67dnas8Ygbt+QmLMiOvC8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i+E2cUBq0/PXj+pHaRCr/m/+VDp55dBkHOr1SGQCvaoujIsSUc3R1DlysuJZlTVvS
	 xyY2UIF5wrdOrZ4gDMpP9/4SSs7QzCWe4KKLbGn+xBNiGa5NJpIJF+ADOK8mmv3orL
	 s0aqX0zUb93mz272f3acxQroKAlKOLOwqQ79NRPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF8B3F8049C;
	Fri,  4 Dec 2020 17:31:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E43CF80278; Fri,  4 Dec 2020 17:31:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6D145F800E2
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 17:31:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D145F800E2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1607099491873909950-webhooks-bot@alsa-project.org>
References: <1607099491873909950-webhooks-bot@alsa-project.org>
Subject: How to set channel balance in amixer?
Message-Id: <20201204163141.2E43CF80278@alsa1.perex.cz>
Date: Fri,  4 Dec 2020 17:31:41 +0100 (CET)
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

alsa-project/alsa-utils issue #73 was opened from quantum-booty:

When I change volumn using keyboard media keys, the left and right channel becomes imbalanced. 
![image](https://user-images.githubusercontent.com/28958399/101188833-23befc00-364e-11eb-8816-efd94b9514d4.png)
I currently have this mapping in i3, I would like to add command to balance the channels after I change the volumn.
bindsym XF86AudioRaiseVolume exec --no-startup-id "amixer set Master '5%+,5%+'"

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/73
Repository URL: https://github.com/alsa-project/alsa-utils
