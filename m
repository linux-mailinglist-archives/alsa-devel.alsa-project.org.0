Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4047D153CCC
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 02:55:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B30E5168A;
	Thu,  6 Feb 2020 02:54:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B30E5168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580954124;
	bh=WoSHsQrlHm+zATOtEaada/jY3CdyoR7HevnL9iDZu1A=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JCtPA2ccq03B99gyPOg4T+02sWCk2mZOV6I3Ng7D1ZlWq3Uk4lMqccbXlpypL5y88
	 1ZXcKgm7bU4ppDvT+hTKfLi32qsRq/N5mBuM4wTjj2n5JTCjhkP0Gea0mhlzUAM46R
	 8zxJeETdA/oezSi0/xZxDSA/8U8KDK0cv4mgXF4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0BA3F800AB;
	Thu,  6 Feb 2020 02:53:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB043F80148; Thu,  6 Feb 2020 02:53:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FFC6F800AB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 02:53:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FFC6F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="zuysHgoU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VPfNvOkQ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 723A46AC;
 Wed,  5 Feb 2020 20:53:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 05 Feb 2020 20:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=l52a7o/q04E9vt6OS0mC2Mkt7Rz
 Yy8rgKQ+XLSVZc9Y=; b=zuysHgoUck4QIanag10F6I1O/3qTfl3ryREH0nvdTiK
 HLEHxECMQfBpQIFlK9NYgW63NbRLZ+yVKJIP7GMQDPQPqVZIRbG5sOqHOJdZbQzu
 WIdfHjvzrkbZYF5yIy0w4I1BuLJboRqnZLzM5BpTf9s4igm7eQnvqhxK4lRC1qkx
 eBkJpJMPKoGIBDMD9uIWoQ/HrNJYOnksQUf6yrG8/CoKdvHWZuMWo2wflKzYlYHw
 Mc43KSxuBCWdYM+/JyjQ0eCHpluGWdqLdy0khoz8vteuxBuKu4EEiijTtz5fYF5X
 wOnbymfA6MFR31e2FFkmERnHX3wspgYDy+3F7UdHXBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=l52a7o
 /q04E9vt6OS0mC2Mkt7RzYy8rgKQ+XLSVZc9Y=; b=VPfNvOkQZaAjQ1CZ/bw2Pj
 pbMExFs75gv1N7m2U8xZU+St6dj/2csZFQSbXHRGe5JUfxd9Adt2hl3iOMN6l1LM
 mpWR6bScL+GQDQ4Lw4g/SECR2/OWYUzlA2cW7YQeml0tF0sESNR4+M/7w7uWCxN9
 tfAd9zhEUpIvO0SSWBniBjHF3nRMqBt+cv+1Ly5++jRDTY9j21NiXVHjbeSwxbTX
 JFK1MlgHcdetUbwYc/Px2ZknW70sI6sliScQTXoTHP1N6q2GvU2/hwX9Yktspv3J
 EG4bWHdTbY+NTQGbUNZbvhUVObjXwvxW3GkcHRRjDEOJmHpJy6aiPzWgRPVW3h3Q
 ==
X-ME-Sender: <xms:nHE7XlGBoJ7XQogzUTpdFpQVG8fnhz7bVdmQiFq2rxSKk0_WJbTYDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrhedvgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucfkphepudegrdefrdejgedrudeikeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhp
X-ME-Proxy: <xmx:nHE7XjoHkCTq5uf-mK0TWyN9pHuomHV6KySVYdIFN-kAHV2gHc7nnA>
 <xmx:nHE7XvKYGje9JUrq_UkSauErsN7OToGrhEDO8NEIdInnTv_l-_SXiQ>
 <xmx:nHE7Xkzq43r3To1wkCqu4-njJFzuKnWcqsXDB4_Ek8_GXOcz1tqkLw>
 <xmx:nXE7XstMKIq0xnMo3AR5aT3NkEeTOPZNAYaPfUNeNJhjkEuKIA091g>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id B8A1030606E9;
 Wed,  5 Feb 2020 20:53:31 -0500 (EST)
Date: Thu, 6 Feb 2020 10:53:29 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michael Forney <mforney@mforney.org>
Message-ID: <20200206015328.GA5014@workstation>
Mail-Followup-To: Michael Forney <mforney@mforney.org>,
 alsa-devel@alsa-project.org
References: <20200205081221.18665-1-mforney@mforney.org>
 <20200205081221.18665-4-mforney@mforney.org>
 <20200205102553.GD9810@workstation>
 <CAGw6cBsYot=_AZRKkctate=CczPuy0kk10133c8-e3NhZXYE3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGw6cBsYot=_AZRKkctate=CczPuy0kk10133c8-e3NhZXYE3Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH alsa-utils 4/4] Avoid empty initializer list
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

On Wed, Feb 05, 2020 at 04:02:54PM -0800, Michael Forney wrote:
> On 2020-02-05, Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote:
> > Good to me.
> 
> Thanks for reviewing.
> 
> > I think it better for you to generate cover-letter (--cover-letter
> > option for git-send-email) when posting a batch of patches.
> 
> Sorry about that. I'll make sure to add a cover letter next time.

Oops. It's an option for 'git-format-patch' command... I'd like to
correct it, sorry.


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
