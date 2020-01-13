Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7D913AA95
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:19:56 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5073E2773;
	Tue, 14 Jan 2020 00:38:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5073E2773
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D40C3F801EB;
	Tue, 14 Jan 2020 00:37:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F265CF801EB; Tue, 14 Jan 2020 00:37:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D51F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 00:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D51F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Ijd9tvkN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KBTEE+hi"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D30C2233F;
 Mon, 13 Jan 2020 18:37:37 -0500 (EST)
Received: from imap22 ([10.202.2.72])
 by compute1.internal (MEProxy); Mon, 13 Jan 2020 18:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=Fw9v3VOx7uIzlqhVg/L2CyTDbOYe
 49WRhGhXfUpOrHk=; b=Ijd9tvkNNKS+/GRC8AygwCl8wUUh+gfjj1wuR6Egze8a
 el/5eHY/LTSlLuu4uLmTIsvv3x4xeHwcT8vZPdfek1Xscw1sayxpo+aqcP2rzJHK
 llEH4BGxwxqrEnW4UKyKCKsCeEXZZgOv4EONoGAtiS/8urQXyHzEcHwH3fA6Nc7g
 6xmFD04BabYlX7AJWDoUv7xpmFtk2YZtS6WKJcLQHzL5QGkSoW68iiAKSYj3EHlL
 M0exYbEWzZ8hi8JXC7tXTiSlrX58m0Mvn+6HOJyZ8cWXDeHCYgoenilTDjbDMnQX
 koyMt2wDkdSpQcPgCEIgjLoMxBfv+eXzCHkdevUZZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Fw9v3V
 Ox7uIzlqhVg/L2CyTDbOYe49WRhGhXfUpOrHk=; b=KBTEE+hiQ/ioxH7/VWVkDn
 QAPtEJ5uK+P8s3DELUqoJgrE0Ps98Ln6LLal2jB8DPtRy05rH8sJnJVcJs9WJaiH
 cslEXGawWtA5GP+xFBBClBxfZoe1isD17E13g5bNy5M9k4LmGeIrXGHiqm1cXi6J
 WxvcffqQGLJ5Q9XvD4gfC9+CwIPaFUDlPZtvMG8EBOOMsduv+lzlc8DatgsiScwB
 uqqQtTTLHyUp6EO5Tv80Ci1brshKnY1zqMBaWzmEnlU5JMInNEZQz2PAwukfZrVv
 MmcmKHjmyJzT7aTVR5zr+OddJxJ+lIXmTxXQ08HbmF3zl7xGe7VlrGh23ldb9ZkA
 ==
X-ME-Sender: <xms:QP8cXmmHOV7RecTWUgd6xssXWvwM9on-8BtJ5uIYCneQRkuXmrxXHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejuddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfvrghk
 rghshhhiucfurghkrghmohhtohdfuceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjpheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
 rghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:QP8cXoYL3R59vacGfJA8YHckARPYZo9uGiTfekmaFQO9Xwlk_jbxbA>
 <xmx:QP8cXhNaIGlz6O3L8tR5m7uf0C7-SbOy60A0VnQXA-JKR0FYciGZuA>
 <xmx:QP8cXtaheARjyjLJRoN7yiwU-GEYTPc76SqUgLy449F-t2NK9zqKuQ>
 <xmx:Qf8cXgmgMqRWLfFebLII4PBlQK5Lu3jvD5wp3uoE0q_4pPwgCmLFsQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 62652668005F; Mon, 13 Jan 2020 18:37:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <3e94aabb-4689-4364-a16f-738c7b487b26@www.fastmail.com>
In-Reply-To: <trinity-bee95b09-4805-4082-91a4-86c5665827a8-1578935257838@3c-app-webde-bs21>
References: <trinity-bee95b09-4805-4082-91a4-86c5665827a8-1578935257838@3c-app-webde-bs21>
Date: Tue, 14 Jan 2020 08:37:16 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Yannic Korten" <y.korten@web.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Github MOTU PCI 324; Motu 2408; Motu 1224
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

Hi Yan,
(CCed to alsa-devel)

On Tue, Jan 14, 2020, at 02:07, Yannic Korten wrote:
> Hey Mr. Takashi,
> I'm new to Linux and new to Github. If you think this is spam or you 
> wanted to be in private: See this mail as spam - ignore and just delete 
> it. I'm sorry then.
> But I have a problem and don't know whom to contact. It seems like you 
> have much experience with coding and the usage of ALSA (which seems to 
> be your project).
> So, my setup is the following:
> Ubuntu Studio 19.10
> MOTU 324 PCI Card (detected as 'Multimedia audio controller: Mark of 
> the Unicorn Inc PCI-324 Audiowire Interface (rev 0a)')
> MOTU 1224
> MOTU 2408
> So I tried to install your files from github but it seems not to be 
> working. Either it's because it's just the support for some newer MOTU 
> devices or I'm to dumb.
> Is it possible to get the above devices fully running on linux with 
> your "drivers"? Or are they not supporting?
> Will it be possible to insert them to the code (easily)? Or is it way 
> to much expenditure for that old devices?
> 
> Thanks for help
> Greetings from Germany
>  Yan

I'm an author/maintainer of ALSA firewire stack which includes snd-firewire-motu
driver. The driver can handle MOTU's FireWire series for IEEE 1394 bus; e.g.
MOTU 828mkII. Unfortunately, the driver is unavailable for your model.

Your model is not compliant to IEEE 1394. It's for 'AudioWire', which is proprietary
protocol developed by MOTU. Like 1394 OHCI card is for IEEE 1394 bus,
PCI-324/424 ASIC card is for 'AudioWire'. The ASIC is designed by MOTU itself
(Precisely S&S Research, Inc.) and the detail is closed.

Although PCI-324/424 card has physical ports into which IEEE 1394 cables can
connect, and actually AudioWire uses the same cable of IEEE 1394a, signals in the
cable is completely different from IEEE 1394. In the summer of 2015, I bought
AudioWire-based model (it's really cheep in used market) and attempted to
connect it to my IEEE 1394 bus analyzer. As I expected, nothing can be detected.

I guess that PCI-324/424 ASIC integrates a sort of computing core (e.g. ARM7TDMI)
with PCI interface for AudioWire protocol. For this kind of device, people need to
work for reverse-engineering by analyze MOTU driver's behaviour in memory space
mapped to host system, and write new driver to emulate the behaviour.

However, this is a kind of 'adventure' and no guarantee to achieve. On the other hand,
it certainly consumes the batch of developer's resources, unless getting enough
assists by vendors. This is a reason that you cannot see AudioWire compliant drivers
as Open Source Software.


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
