Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F47D6A20F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 08:03:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 093F11691;
	Tue, 16 Jul 2019 08:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 093F11691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563257003;
	bh=bPhXbmeonOdNrMMD6LJMWhTY2itI1E2V601LfsS0jMw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ln7bP+VCh3XkWq+4yX+9ESxfVhfsSrwaolrdbmqR4GP2xslKC8XJEv2VgFgKjI1E8
	 nUjdNdWO5JLKz3G7xpmhbfN8iGshdoFnp+hpgWhOry1wzk03zKKIc9+YUM2TccI3Md
	 nMNXY/XJhTgZqQeYvcZLV3LqpGvAylbbLHkn0pCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 778CEF8038F;
	Tue, 16 Jul 2019 08:01:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E385CF80363; Mon, 15 Jul 2019 08:17:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp3.goneo.de (smtp3.goneo.de [85.220.129.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AF82F800D8
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 08:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AF82F800D8
Received: from localhost (localhost [127.0.0.1])
 by smtp3.goneo.de (Postfix) with ESMTP id C2C2623F2CD;
 Mon, 15 Jul 2019 08:17:00 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
 by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DTgEevx57Ss; Mon, 15 Jul 2019 08:16:59 +0200 (CEST)
Received: from [192.168.1.127] (dyndsl-091-248-140-021.ewe-ip-backbone.de
 [91.248.140.21])
 by smtp3.goneo.de (Postfix) with ESMTPSA id 7016023F001;
 Mon, 15 Jul 2019 08:16:54 +0200 (CEST)
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1563115732.git.mchehab+samsung@kernel.org>
 <12a160afc9e70156f671010bd4ccff9311acdc5e.1563115732.git.mchehab+samsung@kernel.org>
From: Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <e3ff0a8a-6956-3855-07be-9c126df2da2d@darmarit.de>
Date: Mon, 15 Jul 2019 08:16:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <12a160afc9e70156f671010bd4ccff9311acdc5e.1563115732.git.mchehab+samsung@kernel.org>
Content-Language: de-DE
X-Mailman-Approved-At: Tue, 16 Jul 2019 08:01:36 +0200
Cc: alsa-devel@alsa-project.org, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Ingo Molnar <mingo@redhat.com>, linux-input@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [alsa-devel] [PATCH 8/8] docs: remove extra conf.py files
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

Hi Mauro,

sorry, I havn't tested your patch, but one question ...

Am 14.07.19 um 17:10 schrieb Mauro Carvalho Chehab:
> Now that the latex_documents are handled automatically, we can
> remove those extra conf.py files.

We need these conf.py also for compiling books' into HTML.  For this
the tags.add("subproject") is needed.  Should we realy drop this feature?

-- Markus --
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
