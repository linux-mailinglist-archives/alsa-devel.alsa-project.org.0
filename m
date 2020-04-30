Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 157CD1C03FB
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 19:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98E1168A;
	Thu, 30 Apr 2020 19:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98E1168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588268266;
	bh=PZ48SsLzwfT9t2FGibzbBtbh8cmNkqmewGA9KyuPYcQ=;
	h=From:To:Subject:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3ElAjXrO+pnjghSNWCWaLHa8mUOW9tN1EirrvuUbUqtqUef517sJdT1lLonXBkSV
	 +jghc1iTUsW2WVz5uRy6zd3Aiun3cnycAlIQq7i/zcW4NooScJpoMyqUsbhxC2dRHv
	 iJXuw6eUgSqGUnsDgxMxJhZVnVvaw6na8HG/aLIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD46F801EB;
	Thu, 30 Apr 2020 19:36:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D91AF801DB; Thu, 30 Apr 2020 19:36:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from depni-mx.sinp.msu.ru (depni-mx.sinp.msu.ru [213.131.7.21])
 by alsa1.perex.cz (Postfix) with ESMTP id 5E01FF80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 19:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E01FF80123
Received: from spider (unknown [176.192.247.171])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id E49C11BF43D;
 Thu, 30 Apr 2020 20:36:17 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcm: oss: Avoid plugin buffer overflow
References: <20200309082148.19855-1-tiwai@suse.de>
 <87v9lhkk5h.fsf@depni.sinp.msu.ru> <s5hlfmckjne.wl-tiwai@suse.de>
Date: Thu, 30 Apr 2020 20:35:54 +0300
In-Reply-To: <s5hlfmckjne.wl-tiwai@suse.de> (Takashi Iwai's message of "Thu,
 30 Apr 2020 18:44:53 +0200")
Message-ID: <87r1w4lvut.fsf@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org
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

> The fix is already in sound git tree, and will be in the next pull
> request to 5.7-rc4.
>

I have tested sound-5.7-rc4 tag in sound git tree and it worked for me,
thanks!
