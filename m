Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9091A19086B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 10:03:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1D501657;
	Tue, 24 Mar 2020 10:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1D501657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585040630;
	bh=4S+sem1z9Ea4nzhSWWYb5a1YqBg3fMcCVaDBwOAwjN8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rk95yPS9A+K2wyYlT0Qzoa2FKR9w0g52zfEfRwUJvROJMieGw1Q+WQHmuHKR1ZP7d
	 CtIo4QfwU262LEqab8i7HIwQY6mrDrs7INc8pmEql4uak3zZg3ELsgGmBzL9+Dzcfy
	 bwquqkXFJ0jemYY5RGYQalzzQHZ484uSEMcbh2Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A00F800B9;
	Tue, 24 Mar 2020 10:02:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36D47F801F9; Tue, 24 Mar 2020 10:02:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 431FCF80095
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 10:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 431FCF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="cX8rgo/U"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="T5CuIALK"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id B770F729;
 Tue, 24 Mar 2020 05:01:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 24 Mar 2020 05:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=E35SptRbaB/K521ACd/Lq3Hy+j/
 iEtcoZXTSvuvVpOM=; b=cX8rgo/UI6GVfXHG5tgqJrRjaWhy+D/vFvRzMQhp3j2
 fK0Iv3JkiL8GtWlhMa/SUzvOaNAaMNJesRZd7eLWFFI/iFsXSZclnnxtLabLIexM
 Hf6wGNXRJfFyjYxTboXHJOKEaWfJok75X9uZ5oznf41bC9qeo26Pt7TcskkKTylh
 1lWzRnJHMFUjzazZJzPP7MGE5Xvo7ympohVe5VIs63Je2E642606Z5T8MIM9zBZN
 rQJoj904z3i/N75akADZ7pUdswC0bYrNagozAE62oCsg9OtAwXdiAdYUgeviobBK
 hn+DXDnQUuPxnmmoC0PrtAOs9y/+tjHBffny5x9VU9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=E35Spt
 RbaB/K521ACd/Lq3Hy+j/iEtcoZXTSvuvVpOM=; b=T5CuIALKmnTTYKs0MrGHsA
 ddI9mrRH4Bu3I7m1t3d4ZY8aV7ndHJD9CAzCNi110lFXhJIZROmv+c4OJT4S5jMI
 WY86J11SsdZ+0kTfpeKQ9+8rvdDyYcIuWt69WIz2jFEeHJB9WmLkC+CCBhCqChs8
 hRQz0fSKE4vvQ7GMnpkgmWhymFzUGwjvX2VMiEwo9v3OfWfzrv4q169iUMLcKLNY
 B8Wot/gxhfQwQVfK9EOBdP8VUdUzxNAnFZOSPNPsSzEVQ24caEYnRjHPOWX0SkQP
 Wi5jUAZBt9c1dzxWAxiUpCXpREqPcVSNktpUGhWKxNAkLACI4XP0g3/SAHl3WJ9g
 ==
X-ME-Sender: <xms:hMx5XiYrPBvTG6gna5IRUEwT3U-8MS1J4pzgseIvc2ATqMs_tlxJUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegledguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghk
 rghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhpqeenucfkphepudegrdefrdejgedrudeikeenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttg
 hhihdrjhhp
X-ME-Proxy: <xmx:hMx5XiIttf-gwTZqGncYXbsgZGe3TejJBG6oHXqcLpkndK5HKC_Y1Q>
 <xmx:hMx5XnhDnRjliHaAAwkLn243MWyyr_He5DaopTwXjMF4tLjhLA-f3A>
 <xmx:hMx5Xn5EMRSTG0jnWs7GqG0mvNrPbFzoRKpN8xMiNkOyI64KRSGz9g>
 <xmx:hcx5XnSpt9q45g-odKc9Qg-w4pjhESqCHKhQaTdgSXOE76m1ilU6eg>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D2173280059;
 Tue, 24 Mar 2020 05:01:55 -0400 (EDT)
Date: Tue, 24 Mar 2020 18:01:53 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ALSA: core: sysfs: show components string
Message-ID: <20200324090152.GA14579@workstation>
Mail-Followup-To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org
References: <20200323193623.3587-1-pierre-louis.bossart@linux.intel.com>
 <20200324015331.GA3679@workstation>
 <d31659cc-d528-345f-1e56-b0cfae36be5c@linux.intel.com>
 <20200324043336.GA8342@workstation>
 <a74e4b68-d6f6-c12d-d600-d8cb7321cc00@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a74e4b68-d6f6-c12d-d600-d8cb7321cc00@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Tue, Mar 24, 2020 at 12:12:15AM -0500, Pierre-Louis Bossart wrote:
> when people report that their microphone is not reported by PulseAudio/UCM,
> it's very helpful to know what UCM was supposed to use in the first place.
> We don't have a debugger or step-by-step mechanisms to figure out what the
> configurations are.

If I get your intension correctly, the addition of sysfs node is just to
investigate which use-case configuration is applied in cases that people
get issues. If so, it's really exaggerative in a point of the concept of
sysfs.

I have two alternatives. If it's possible to focus on ALSA SoC part only,
addition of node to debugfs is reasonable for this purpose.

Another alternative is to change output of 'cards' node of procfs. The
latter is commonly available for all cases. For example:

diff --git a/sound/core/init.c b/sound/core/init.c
index b02a99766351..9a04974c1d19 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -805,6 +805,8 @@ static void snd_card_info_read(struct snd_info_entry *entry,
                                        card->shortname);
                        snd_iprintf(buffer, "                      %s\n",
                                        card->longname);
+                       snd_iprintf(buffer, "                      %s\n",
+                                       card->component);
                }
                mutex_unlock(&snd_card_mutex);
        }

(If you're investigating to use rules of udevd for automated application
of UCM-based operation, there's a space to investigate the merit to expose
information via sysfs node. But actually you're not...)


Regards

Takashi Sakamoto
