Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B4D240506
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 13:05:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC1CF1663;
	Mon, 10 Aug 2020 13:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC1CF1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597057506;
	bh=zQC1vvS/y18CFbW0vPdZ6HQQj0n6JvZ/8cEj2mChF+w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hG1m4EwVouB8SbwjTrDKSrIVtC/3ryQ7EE2gGVYLzNwwUDYZg/vhbrcay3d8HcQO3
	 M1HFL/b4mJGw2/whl/v/qrMQ681QFakYcVdO+QA0msBfI9kt+EPebF3xSFtOJBr/af
	 bTXRcrdI+APp2w2g8TCz85CIr99pEGknFevy3NVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25913F800CE;
	Mon, 10 Aug 2020 13:03:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40AB6F80085; Mon, 10 Aug 2020 13:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE798F80085
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 13:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE798F80085
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 412193FA60;
 Mon, 10 Aug 2020 11:03:10 +0000 (UTC)
Subject: Re: [PATCH] ALSA: usb-audio: work around streaming quirk for
 MacroSilicon MS2109
To: Takashi Iwai <tiwai@suse.de>
References: <20200810082400.225858-1-marcan@marcan.st>
 <s5heeoe6a2l.wl-tiwai@suse.de>
From: Hector Martin 'marcan' <marcan@marcan.st>
Message-ID: <59bed004-d55a-f710-e303-fc55b9f35434@marcan.st>
Date: Mon, 10 Aug 2020 20:03:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5heeoe6a2l.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
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

On 10/08/2020 19.59, Takashi Iwai wrote:
> Hm, that's fairly weird behavior, but the workaround looks simple
> enough, so now I applied as is.

Chinese $10 capture card quality silicon... :-)

FWIW I tried stopping and starting the stream repeatedly and the 
workaround seems to be reliable. I also checked the packets with usbmon 
to confirm that there is no weirdness in the driver, it's really how the 
data comes in from the very first isoc packet sent by the hardware.

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub
