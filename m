Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6D3A3A56
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 05:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D54D1843;
	Fri, 11 Jun 2021 05:38:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D54D1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623382771;
	bh=XVWr1nNaNuQm5Z5bBWiZTd4iY3wg1NfL9Rr35XpGH2c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M2cbikDcD8SLS9myEJA6l5L9MZrTFLLMx8NDh/L4Sw5lHUdX1FbNJ1eiCoisFN4Qm
	 n71Epw0PEy2/0zHhV+SOfZPmXad6iZbL+64+AuOgu/IcekG32huwPxfFJ9iNsvEFFh
	 6frhfwJGx3dHTtBBpMq13p+N+GXygC45jGeRkXe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAB2AF802A0;
	Fri, 11 Jun 2021 05:38:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D60DF8027C; Fri, 11 Jun 2021 05:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88149F8026C
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 05:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88149F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jWUxjv7+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uY6Rc/sx"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 74C971BD8;
 Thu, 10 Jun 2021 23:38:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 10 Jun 2021 23:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=RuqBvhyE8WSoihJKDWCmmn6Ra7O
 TmipqE2zSj0ZRk8g=; b=jWUxjv7+BqW9Wg+OBUXDADC0tBw+hTAM4wUYusw8U5o
 ax2WGmJfJanQRNYxgwemtK0g0kPCUtC91o+yeflHB+0R5+gXbAT7hR7JvW2UfZrx
 yumRCzzCvd0wUKn28o1flKsqTdn8/56eihZaCyo7RhCZbV6Jtoy5R9ooDUzp9/Ni
 C2K5GXTozzHLgLP3nPSbiX9jLn/uyPLLarclEhuMxkP4jx+Q/p3xh1S+CYnNwZ+v
 LFRxRs2k4y4cdLJc5twFJfSbEpQJ7ev+4RH1ARxq1q3KTaDd+/qD8e1m2cGsvWB2
 am2+xyYJUDuz+taqjb9httoZI3GeghOqARopa4UXN8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RuqBvh
 yE8WSoihJKDWCmmn6Ra7OTmipqE2zSj0ZRk8g=; b=uY6Rc/sxctcXuFpiYjiW34
 u6kADk7N//sKNcO+LMx4NtnmjYMM8A5j4AARgcwAVYQoA5/YX94ZB9ur9z38g1lJ
 nNMA8EPg8Utbj8Wb9hLtTZ3GrktsCFeETyLmWMsEbJEZv99NrJSV3dWQff/XkKG0
 qfrVPk3k2gDevadt1npIe04tSKf/C4M6vNCH5XlAUfuW2NKM8o6U3iEPEAcHfZSi
 ce+t7zzHgr9iWQr2ymH+SCmh15CzOIVzC1MEjlS1S803lygEdsn8HM1lx+3nSMXG
 TMEe30fjfPnTsVzwmivFCGwnHpt+abrntUSMDNq3M5gqXdI7JFIyNAN+R5mZO7mw
 ==
X-ME-Sender: <xms:rNrCYDek3MmECxISvXxOKoC_TYlITO5lC4Jq-StUvVotHoNx2wssrA>
 <xme:rNrCYJNxJYtczhI4AdyOdjz7SX_EYQEFCjFb6ivj7J4eI_IwIcsJvjxRxn8uNaW5Y
 JIm4KLR4TQP6dKALoQ>
X-ME-Received: <xmr:rNrCYMjF3wdM5joy9ywT_fkKzyFgH2UD4Pqtm2elFo923MHOHOkQto4O_c2zxFq4ibMhpmRIjqLITkgx_N3qmHfpbWBVS1iDdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduiedgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:rNrCYE9SPG9AmT9LCpdhlzW0Mn-O_hG1VH6IiJmEtaaSJGGPMYIi-g>
 <xmx:rNrCYPvJuS0WUfKJhXbaOCfisqDw8RE2VcNf6hY1QEF4ZBBqt2PcMw>
 <xmx:rNrCYDEe3cEciCeiHrlzi6Tr4pjCia6qVYKZxutNzEfqygyjU0zFfw>
 <xmx:rdrCYIW4p9_aLaczJGDJkBH7_ZVHK3-x9cYYhUw9OhD2K_FIcVGggA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 23:38:19 -0400 (EDT)
Date: Fri, 11 Jun 2021 12:38:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 1/3] ALSA: pcm: add snd_pcm_period_elapsed() variant
 without acquiring lock of PCM substream
Message-ID: <20210611033816.GA10978@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20210609143145.146680-2-o-takashi@sakamocchi.jp>
 <s5him2nawim.wl-tiwai@suse.de> <20210609231623.GA3207@workstation>
 <s5h1r9ab22u.wl-tiwai@suse.de> <20210610080521.GA84899@workstation>
 <s5hsg1q9m60.wl-tiwai@suse.de> <20210610082622.GA86308@workstation>
 <s5hpmwu9kuu.wl-tiwai@suse.de> <20210610101243.GA89949@workstation>
 <s5hfsxq9e2w.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hfsxq9e2w.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Hi,

On Thu, Jun 10, 2021 at 01:03:19PM +0200, Takashi Iwai wrote:
> On Thu, 10 Jun 2021 12:12:43 +0200, Takashi Sakamoto wrote:
> > 
> > On Thu, Jun 10, 2021 at 10:36:57AM +0200, Takashi Iwai wrote:
> > > Again, my *only* point is about the sleep.  You addition was:
> > > 
> > > + * Context: Any context in which lock of PCM substream is already acquired. This function may not
> > > + * sleep.
> > > 
> > > where "This function may not sleep" is stated incorrectly.
> > 
> > Hm. Would I request you to show the detail case that the call of function
> > (snd_pcm_period_elapsed_under_stream_lock()) goes sleep except for
> > driver-side implementation of snd_pcm_ops.{pointer, trigger,
> > get_time_info}? At least, in callgraph I find no function call to
> > yield...
> 
> True.  But the fact that those callbacks may sleep means that the
> function would go sleeping after all.

Thanks. After all, our discussion comes from the ambiguity that what
has responsibility at yielding processor under the lock. I think it helpful
to describe devide responsibilities about the yielding. I'm glad for you
to review patch below:

======== 8< --------

From 98e1b8332a95935ae875c637d3ddc27e68689aa0 Mon Sep 17 00:00:00 2001
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Fri, 11 Jun 2021 11:03:46 +0900
Subject: [PATCH] ALSA: pcm: add context section for documentation about
 period-elapsed kernel APIs

This commit fulfils documentation of period-elapsed kernel APIs with their
context section.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/core/pcm_lib.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 7d5883432085..5d28d63a3216 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1803,6 +1803,10 @@ EXPORT_SYMBOL(snd_pcm_lib_ioctl);
  * - .get_time_info - to retrieve audio time stamp if needed.
  *
  * Even if more than one periods have elapsed since the last call, you have to call this only once.
+ *
+ * Context: Any context in which lock of PCM substream is already acquired. The function may not
+ * sleep by ALSA PCM core. The function may sleep in the above callbacks by driver which should
+ * configures PCM device for it (@snd_pcm.nonatomic).
  */
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream)
 {
@@ -1836,6 +1840,10 @@ EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
  * It's typically called by any type of IRQ handler when hardware IRQ occurs to notify event that
  * the batch of audio data frames as the same size as the period of buffer is already processed in
  * audio data transmission.
+ *
+ * Context: Any context in which lock of PCM substream is not acquired yet. It depends on
+ * configuration of PCM device (@snd_pcm.nonatomic) by driver whether the function may or may not
+ * sleep by operating lock of PCM substream.
  */
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
 {
-- 
2.27.0

======== 8< --------

Thanks

Takashi Sakamoto
