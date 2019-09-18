Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F55B6429
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 15:16:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5D421675;
	Wed, 18 Sep 2019 15:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5D421675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568812599;
	bh=iRTPqielNNeMw9MfH5nqkGYHpdxUnfaznFJfTi+clUg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgnFRsrztrdPAsL+Qfhs+e+wzHWuMwOj+wxgaRcvhjhqy/I5OqXGw/4TAZxp8+/ci
	 gA/s9zAvALwmKRW5+RiIaJyMA9uBy9XQDRFTMpwLu3EcdBet7RD+S9ehBGR3LuEsDT
	 O1Hb8lmDm/ClGfld/uOATZaLuWurhwoemfiKDYYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26664F80534;
	Wed, 18 Sep 2019 15:14:55 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BC75F80506; Wed, 18 Sep 2019 15:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65559F800C1
 for <Alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 15:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65559F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PNSGw/xI"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3C4E42BD9;
 Wed, 18 Sep 2019 09:14:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 18 Sep 2019 09:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=IzpXzLHxuYBVSxY8jM0dyl05cgXlWla+T7K24+LLo
 LI=; b=PNSGw/xI4pj3Mo9KmTBEn9YYaUZ4X4OSH5RsPFJBv9uyDGn7fEg8qjgHn
 GaaqoaB3dQpKcD2vDrWxCsHVzQjmIfbdaq5PDkEULB5UTMQBq607cdTAFcF7qpxw
 /MJtvfcmLL2cG3YjlLBPNsTXvMRLeklsVqFMekEdqAKcEoZ4D6k9f6exroyiN22h
 DBITis4wAdYdhVoJjTVN9L4cbj1MLbi5MSrWn+PH7BStTCTX3+F1KZaLODVZPFk+
 ou/ozY71xPNEDoDinVo+jxM4NilbopN0Z3MjpJKoW9XXCYCoHJEpOIkUdryXH+3h
 KGWjzkS0JFAGFvUL9gFsg8EeU2S6Q==
X-ME-Sender: <xms:xi2CXT5Ne4v991otnT-ZsjWocWOMXPzYEWL4f7vYWSp7rrIqKE3U3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 frhhhishhhihhnghdqkfhppfgvthifohhrkhculdeftddtmdenucfjughrpefkuffhvfff
 jghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuc
 eothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinhepfhhrvggvuggvshhkthhophdr
 ohhrghdplhhisggvrhgrphgrhidrtghomhdpphgrthhrvghonhdrtghomhenucfkphepud
 eliedrvdeggedrudeluddrledtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhk
 sehikhhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xi2CXXYsbmKatWoRuVcURmjdz2171iZa5SWw3iLVWwd7fKdSghrXWA>
 <xmx:xi2CXQorlNFcNi2M6X5lJyGdXp3DElVZMO7fzThE0tFmZPhp4zmOmQ>
 <xmx:xi2CXY77PbFhSMf8EVPFkNpbOR0cHOpjZCwb4KzY89r00fKArGviuQ>
 <xmx:xy2CXXsXdk-xRPV-y2nZhPOfkXjBGuG1Ng9d3f6eQIzXkkTvpGm_xA>
Received: from laptop (unknown [196.244.191.90])
 by mail.messagingengine.com (Postfix) with ESMTPA id 19A1FD60068;
 Wed, 18 Sep 2019 09:14:45 -0400 (EDT)
Message-ID: <f684c2dd863a79cbeb12d66434197a23b15846a9.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Eric Desjardins <desjare@gmail.com>
Date: Wed, 18 Sep 2019 16:14:42 +0300
In-Reply-To: <CADsNRHvEkD4Vhtq+EPt+qLVebwhuniqyK3J1zUnGu-jQ5=2d5A@mail.gmail.com>
References: <CADsNRHsGeM3bMv3Xh++QbZXeR1PBr30VkzoweyCqMKeAguXRUg@mail.gmail.com>
 <c3986f3fde3a2e008d9c2d81542aaacf9d751e62.camel@iki.fi>
 <CADsNRHvEkD4Vhtq+EPt+qLVebwhuniqyK3J1zUnGu-jQ5=2d5A@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: Alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] 5.1 to stereo using libasound
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

On Sun, 2019-09-08 at 08:54 -0400, Eric Desjardins wrote:
> Thanks, my file didn't use the default channel map.
> Where are the defaults are defined?

(Sorry, I forgot to reply to this earlier.)

I don't actually know where the ALSA default channel map is defined in
the ALSA code or documentation (my impression is that it's not
documented at all). In PulseAudio code it's defined here:
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/blob/master/src/pulse/channelmap.c#L254

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
