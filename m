Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB2130ED
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 17:09:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DA7F17FD;
	Fri,  3 May 2019 17:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DA7F17FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556896192;
	bh=R0ifkeoFVvxiyxL6OH8ggHXlmRWrZdy1Lz0ksoJ1SM0=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1jmTMg+vM4L+J+BsjsK3Dl0sShaPCHPJJkSq0MYiFGHSNrAxEaWFBXwf5W70B9QU
	 W3Ne+zLiIOnt+Mu+HueI5J+rylS1L2/SchlthAcmcGcwPSsc4F1fds0MiFszGMACbu
	 fMx1i9w3xVzZKnJG6G/pfHi+oTlTTXmr287MYtTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EF44F896B6;
	Fri,  3 May 2019 17:08:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C10FEF896B6; Fri,  3 May 2019 17:08:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CA49F80720
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 17:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CA49F80720
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="C5abyg8G"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 74BC4245
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 11:07:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute1.internal (MEProxy); Fri, 03 May 2019 11:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IVRygQ
 5mum5VFep6oB81WhcouPf0rD9gjweTg9vcN+w=; b=C5abyg8GLKHOYDmwQqmczx
 vgmXYJyKZF+RhrFalrihoW+USqQuGDIxGVfCk0TRCcevOXSApsKq0eRkEn2vXpdy
 hHT9zycWPgqNGPd/w8prPqfnHLMUwl7789EC3pkXf8g0asx742hYG7e+01b81bhX
 cH5AvJAYyTW5PsyXSIJucxo8XXza6Ou+jyTEnI6eiCs6ffJG6Dirnwb5XMg/pfN+
 V4y+odrOcwL4BQW8aShwK1bR46IkQveCmydQ3SEcMXRmbQoaFQOgjpdIzxiGCxuy
 2JxtXGiRutn8mfaHgVZAtZPY7H7O52hQa3wR7+nQNQ5KYYxFUJnl3e9sliDc+eaw
 ==
X-ME-Sender: <xms:TVnMXBQURfpjfWk9cxwoDn1obVe4eYv5guLSe6n9ue7xpF1FsBOzWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedugdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreerjeenucfhrhhomhepfdflvghrvghmhicuufholhhlvghrfdcuoehjvghrvghmhies
 shihshhtvghmjeeirdgtohhmqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrd
 horhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghrvghmhiesshihshhtvghmjeei
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:TVnMXLfr2qi5BhKLTc15Tl0C1XUeGDy5S6Nvvyl59jp6yy9K_WZQyQ>
 <xmx:TVnMXLWYgfZHwOiT52SAVae68iVO6r_Ys9F1EEWigW7rJure64r7Yg>
 <xmx:TVnMXJgsjzOG1I-mDebgvh3yJQ-a2bEz6EONCh5iMvwXh9Wo2trz7Q>
 <xmx:TlnMXBtSGVRiHfrUxKgP8IHbBWxOIHlU7iAMgnd19gtKs8m4IsnrHQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A143A7C6D9; Fri,  3 May 2019 11:07:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <529da7d1-ae84-4010-9fe8-6f9c69dfb4f9@www.fastmail.com>
In-Reply-To: <s5h8swrfm5v.wl-tiwai@suse.de>
References: <20190402135204.11563-1-rs@tuxedocomputers.com>
 <s5h8swrfm5v.wl-tiwai@suse.de>
Date: Fri, 03 May 2019 11:07:54 -0400
From: "Jeremy Soller" <jeremy@system76.com>
To: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel]
 =?utf-8?q?=5BPATCH=5D_Headset=2C=09microphone_and_in?=
 =?utf-8?q?ternal_speaker_support_for_Tuxedo_XC_1509?=
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

The use of PB51ED in the enum variant does not make complete sense. The System76 oryp5 is based on the P960ED and  P960EF models, not the PB51ED. I am about to add two more models that require similar fixups - NH58RCQ and NH70RCQ.

This patch basically applies to any current Clevo motherboards with an ALC1220 and a headphone combo jack. Perhaps something like ALC1220_FIXUP_CLEVO_HP_COMBO would be a better name?

-- 
  Jeremy Soller
  System76
  Engineering Manager
  jeremy@system76.com

On Wed, Apr 3, 2019, at 3:57 AM, Takashi Iwai wrote:
> On Tue, 02 Apr 2019 15:52:04 +0200,
> Richard Sailer wrote:
> > 
> > This adds a SND_PCI_QUIRK(...) line for the Tuxedo XC 1509.
> > 
> > The Tuxedo XC 1509 and the System76 oryp5 are the same barebone
> > notebooks manufactured by Clevo. To name the fixups both use after the
> > actual underlying hardware, this patch also changes System76_orpy5
> > to clevo_pb51ed in 2 enum symbols and one function name,
> > matching the other pci_quirk entries which are also named after the device ODM.
> > 
> > Signed-off-by: Richard Sailer <rs@tuxedocomputers.com>
> 
> Applied, thanks.
> 
> 
> Takashi
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
