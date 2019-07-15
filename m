Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDBD684BB
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 09:59:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 027881669;
	Mon, 15 Jul 2019 09:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 027881669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563177594;
	bh=b+TA0E8QMYEMciCajNzAdB09qq8dD0AD8Lxcxu1sBrw=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XG5PAE6x5dqzAbcVVOtnKDZ9jmf+stzYDGppImGLBjqs8PULkExshxQU/sMzJwBR4
	 Z478aoGuUyi7s2OHX1ZHmUzC95kuTOr/YNOJUpb30lxTLweRQrpPy1ozEfXWUebwoX
	 DDEj8V1r1VqUiL97qo38JNjHo3om3XngqYcytTw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4DAF80369;
	Mon, 15 Jul 2019 09:58:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A5EAF80368; Mon, 15 Jul 2019 09:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D412FF80363
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 09:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D412FF80363
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="JcDzLwBG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eJlbjim1fxU57ZaVX/VVgKi/dG9GtJerPxx9UJo7Fww=; b=JcDzLwBGAR3DIQ5PzjliPmdfB
 wt3f3sg2z3AO/OuERhsRmMQS2qwxDHfr81HUZ8bO4iiwRmK3RrOm2h4/5DNGgtFEZDvuz7A8dJNNm
 8SC+KQ1Nwm9BOBk47L69bPbiRtcflOhdeLDtFR53AOVtvZ10BSu6RTR+jOSoexCb+TOn62JzVO7/Z
 O55lv0FaRBBJ2LYyXSZdelp0ocAQap0NW6KHdOxn0lTVtf8TDPBJOZV7LLeVVU8RcXQa7O955vRo5
 mleM8mlHWSbuEWzj/LK75trdO7CY3hdfI2sN1X09S7ln7kgJuHQUi7kWjs9YHKWyAOp1nM2lXWTrS
 FqvVaEtvQ==;
Received: from [189.27.46.152] (helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hmvrD-0003qC-8d; Mon, 15 Jul 2019 07:57:11 +0000
Date: Mon, 15 Jul 2019 04:57:02 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <20190715045702.1e2b569b@coco.lan>
In-Reply-To: <e3ff0a8a-6956-3855-07be-9c126df2da2d@darmarit.de>
References: <cover.1563115732.git.mchehab+samsung@kernel.org>
 <12a160afc9e70156f671010bd4ccff9311acdc5e.1563115732.git.mchehab+samsung@kernel.org>
 <e3ff0a8a-6956-3855-07be-9c126df2da2d@darmarit.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Rich Felker <dalias@libc.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, x86@kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Ingo Molnar <mingo@redhat.com>,
 linux-input@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Em Mon, 15 Jul 2019 08:16:54 +0200
Markus Heiser <markus.heiser@darmarit.de> escreveu:

> Hi Mauro,
> 
> sorry, I havn't tested your patch, but one question ...
> 
> Am 14.07.19 um 17:10 schrieb Mauro Carvalho Chehab:
> > Now that the latex_documents are handled automatically, we can
> > remove those extra conf.py files.  
> 
> We need these conf.py also for compiling books' into HTML.  For this
> the tags.add("subproject") is needed.  Should we realy drop this feature?
> 
> -- Markus --

You're right: adding "subproject" tags is needed for html. Folding this
to patch 7/8 makes both htmldocs and pdfdocs to work with SPHINXDIRS
without the need of a per-subdir conf.py.

Regards,
Mauro

diff --git a/Documentation/sphinx/load_config.py b/Documentation/sphinx/load_config.py
index 75f527ff4c95..e4a04f367b41 100644
--- a/Documentation/sphinx/load_config.py
+++ b/Documentation/sphinx/load_config.py
@@ -51,3 +51,7 @@ def loadConfig(namespace):
             execfile_(config_file, config)
             del config['__file__']
             namespace.update(config)
+        else:
+            config = namespace.copy()
+            config['tags'].add("subproject")
+            namespace.update(config)

Thanks,
Mauro
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
