Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D6058289
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 14:25:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2311729;
	Thu, 27 Jun 2019 14:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2311729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561638337;
	bh=OLyg5xuy/jaNO7bBTSWb/hCYf3sMqX5rCTjW5SyfLjc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=My+uvjYSi7ux2+eo/U3IBaDJzG/9CAwBiKtHH+CyvQWYpbdpja7dmnYmidYuIg8Gn
	 /wY+z/xPpX64d/lA8PD9XBslV0RNLTw19pJaOUfWYdxGkSN2amZFXlDoSHjUNQy7n6
	 lXfPHCe6Sj3depaAGPZFOy3uZYkchqCDzXrF5WLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76994F896F6;
	Thu, 27 Jun 2019 14:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A042CF896F6; Thu, 27 Jun 2019 14:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BB45F806F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 14:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BB45F806F0
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id B535BC80D0C;
 Thu, 27 Jun 2019 14:23:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyyy7EUnA-bP; Thu, 27 Jun 2019 14:23:47 +0200 (CEST)
Received: from [10.11.2.101] (unknown [188.193.2.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: rs@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 796FEC80D0B;
 Thu, 27 Jun 2019 14:23:47 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>
References: <20190619113311.31656-1-rs@tuxedocomputers.com>
 <s5ho92jr0ov.wl-tiwai@suse.de>
From: Richard Sailer <rs@tuxedocomputers.com>
Message-ID: <f1b9c41e-c726-f556-f04f-acbae461dc1e@tuxedocomputers.com>
Date: Thu, 27 Jun 2019 14:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <s5ho92jr0ov.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, jeremy@system76.com
Subject: Re: [alsa-devel] [PATCH v2] ALSA: hda/realtek: Add quirks for
 several Clevo notebook barebones
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 27/06/2019 08:40, Takashi Iwai wrote:
> FYI, I queued the patch now.  
Nice, thanks for the info.

> Let me know if you find anything new.
Okay

> 
> 
> thanks,
> 
> Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
