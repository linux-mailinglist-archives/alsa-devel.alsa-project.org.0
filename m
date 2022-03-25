Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD324E6F3B
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 09:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E40416FB;
	Fri, 25 Mar 2022 09:01:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E40416FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648195345;
	bh=R4kiqkCwS94wMlyjT2HnXIuKqBJRQSS2xVdsN6wbygk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k0nw2zU1Znw4CX2jNmNxNVTvCqtUL+Q5iA9/3f0hjayB88Hrheo7CneF9xN9hg9lw
	 Nay9oeg545TmbPJc0++3aWHlHOlumgk0FzF7uLiuWiAbTtEU/Hi6QTlkzEr0uI1VNo
	 PJz2sSfZ/8J6NDhgJbWdTCIUgwsmKVrFaSRfCEA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE437F800AA;
	Fri, 25 Mar 2022 09:01:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63DD5F80162; Fri, 25 Mar 2022 09:01:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD8E9F800AA
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 09:01:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD8E9F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="0InZFbog"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DwcbPzTVDRib4L1VsoxgMlldaVEStIsqmgFfJT2ZVEs=; b=0InZFbogVnMbo7ICwYkHgA7+6k
 E8aa3tNj3Cg9SHcU3vU7bszlSErTUNqErsQkEtr8YWm6i+ufRv5Z7P4LcmTb0Rii9N8IEcHwpyU4K
 /ptmmp5IzKuBJmlwusocdTz3zsc1tWZN0L0TlfXvoeECIRCqtCDp+co4Qs4zjEibqfusrPq1QwUfh
 l0Mx9eOQK4hNTVw5MrqeEkztc8M7j1fzEtrX0pNb7gCmpzw2bRGYf4phJUrAL+x5lmHAwDNu/0X/E
 At8SmvuppNYi57yNH5cJphnkPT6Eluy3uofIRr/sSi3m9wbFAXb7kUaS1fOAFEww7+qQWGDYzfACv
 KmAKCT3g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nXesY-001OG5-Qz; Fri, 25 Mar 2022 08:01:02 +0000
Date: Fri, 25 Mar 2022 01:01:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oh Eomji <eomji.oh@samsung.com>
Subject: Re: [PATCH v1 1/3] sound: usb: Add vendor's hooking interface
Message-ID: <Yj12vorW0FW8S6Sm@infradead.org>
References: <1648109444-196321-1-git-send-email-eomji.oh@samsung.com>
 <CGME20220324081212epcas2p4d2ed1f3a1bb020606cf65016efec085b@epcas2p4.samsung.com>
 <1648109444-196321-2-git-send-email-eomji.oh@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648109444-196321-2-git-send-email-eomji.oh@samsung.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: alsa-devel@alsa-project.org, JaeHun Jung <jh0801.jung@samsung.com>,
 Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pavel Skripkin <paskripkin@gmail.com>
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

Independ of the actual usefulness of thi: vendor is a reallly bogus
naming choice for device specific hooks.  No one cares what vendor
produces a given device, it is all about the interface of it.  One
vendor might have different interfaces over time, from different
divisons or thrugh acquisitions, and multiple vendors can agree to
a single interface through open standards or IP licensing.
