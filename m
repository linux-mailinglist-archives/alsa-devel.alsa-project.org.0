Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4196FDEE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 12:38:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD9161756;
	Mon, 22 Jul 2019 12:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD9161756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563791906;
	bh=dtQz/P+2b+1fijwhjUO1ERsziF2SyWeWpGJcJvtsMp0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0dDCY13758wCsn/4HS9zrdZ2GSExaUtG2Mq7o+HQo90C2xy8BBO9+A/8Kv+eklUx
	 78i+J94uXgza3lGKA0GBxP3FtQlcyZGiaV6v9hBoU3J5p0P7x3CQwo0jzbMsuhxBkG
	 XyEX4cbihwDf89mjm4zTwLNzm/RUOG7qfUdWf/UM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE694F803D7;
	Mon, 22 Jul 2019 12:36:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09FD8F803D5; Mon, 22 Jul 2019 12:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4797F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 12:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4797F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A3etmMmU"
Received: from localhost (unknown [223.226.98.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2510921911;
 Mon, 22 Jul 2019 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563791792;
 bh=ayz205pJ9kS0L7afSS68fiQxUn6AsnFT3yMYzykEcxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A3etmMmUk59zCMqKifmT9YEUPB0glTxBIagzrVFM3JBs8L7lr5R2EKEU/jhGGckMa
 qtu3b7S6xWv5sFe8p9x7q116WEwSPzHpZgj9KTLZmT2WG3mMR+BOx3ftdzpvHSf812
 Wx2gfoWILBziRig7i5x65izyuN8Ofekdbq4NoV6U=
Date: Mon, 22 Jul 2019 16:05:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <20190722103520.GQ12733@vkoul-mobl.Dlink>
References: <20190722092436.651-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722092436.651-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH v2 1/4] ALSA: compress: Fix regression on
 compressed capture streams
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

On 22-07-19, 10:24, Charles Keepax wrote:
> A previous fix to the stop handling on compressed capture streams causes
> some knock on issues. The previous fix updated snd_compr_drain_notify to
> set the state back to PREPARED for capture streams. This causes some
> issues however as the handling for snd_compr_poll differs between the
> two states and some user-space applications were relying on the poll
> failing after the stream had been stopped.
> 
> To correct this regression whilst still fixing the original problem the
> patch was addressing, update the capture handling to skip the PREPARED
> state rather than skipping the SETUP state as it has done until now.

For the whole series:

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
