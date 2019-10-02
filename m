Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1956C47BF
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 08:25:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD011689;
	Wed,  2 Oct 2019 08:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD011689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569997549;
	bh=BzzXQRP68CyseLSyKLA1F+AdAIaDNIB7KGaW71trbBY=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=njBAIWqpZ8fYZtNacxFdHptsSwcTRoxkBQBp6JXUeJod19KuXc99nQc0M6dn9WttU
	 8RGR6sg3e23yodd/TANbxoKE3MtixOgmTwLbUOAQQOozJQwBIF0YWtEKDablNjzgXW
	 LQHZ53KVGKtvbm660F1WOfV5SZhQmas97RypYVCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2EF4F803D5;
	Wed,  2 Oct 2019 08:24:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E01EF80391; Wed,  2 Oct 2019 08:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from server54-2.web-hosting.com (server54-2.web-hosting.com
 [198.54.126.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A752DF800DE
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 08:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A752DF800DE
Received: from [::1] (port=52812 helo=server54.web-hosting.com)
 by server54.web-hosting.com with esmtpa (Exim 4.92)
 (envelope-from <liebrecht@grossmann-venter.com>)
 id 1iFY3D-002NEC-SQ; Wed, 02 Oct 2019 02:23:56 -0400
MIME-Version: 1.0
Date: Wed, 02 Oct 2019 02:23:51 -0400
From: liebrecht@grossmann-venter.com
To: Clemens Ladisch <clemens@ladisch.de>
In-Reply-To: <e959c950-4d92-d4a6-dbac-056fbc4b5425@ladisch.de>
References: <0c48cbff966673fe6842621e3e1317f4@grossmann-venter.com>
 <e959c950-4d92-d4a6-dbac-056fbc4b5425@ladisch.de>
Message-ID: <68675fd7e33c6f7883f36438f9067a9f@grossmann-venter.com>
X-Sender: liebrecht@grossmann-venter.com
User-Agent: Roundcube Webmail/1.3.7
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server54.web-hosting.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - grossmann-venter.com
X-Get-Message-Sender-Via: server54.web-hosting.com: authenticated_id:
 liebrecht@grossmann-venter.com
X-Authenticated-Sender: server54.web-hosting.com: liebrecht@grossmann-venter.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] alsa acting up
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-09-18 07:07, Clemens Ladisch wrote:
> liebrecht@grossmann-venter.com wrote:
>> 1) As soon as pulseaudio is started Alsa says 1818VSL is 
>> unplugged....?
> 
> What is the output of "dmesg | tail" immediately afterwards?
> 
> 
> Regards,
> Clemens

Clemens

I managed to solve it.
The culprit is the horribly evil systemD that messes with everything in 
an amateurish way.
I completely removed systemD and all applications dependent on it and 
the alsa worked.

How much more blows to the head must we take with this systemD crap.

In any case thanks for the help. The problem is solved.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
