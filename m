Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE157B4E7C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 14:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402F21673;
	Tue, 17 Sep 2019 14:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402F21673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568724741;
	bh=gF4wA7RHpP+SkpBFOItW3I5Z5lM+Vd9bt5CMCJKpf4I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vQJrnWoRBpQ+YoTd1ViJoYbPwdBI/bdF6pYr50COvd7ED3it4fH01Qni8/DHw1jn0
	 6mXiGnuVsAN93j+iNAB9R12Vp7SvjZM4sW2dY40I4XxVTVj0I3Bvw9Q0r+2nyLcZGV
	 0nSFl9YhQsjo2HUzePhXv57ipgOIj95aHV5D5ItM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45457F8048F;
	Tue, 17 Sep 2019 14:51:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B872AF8048E; Tue, 17 Sep 2019 14:51:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA996F801DA
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 14:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA996F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ceht2QI3"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7EAE7C3B;
 Tue, 17 Sep 2019 08:51:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 17 Sep 2019 08:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=X49pnie4+xsmXZzXGxkaMBzJ6T5jUeYFHmtKTObCd
 pM=; b=ceht2QI3G2MFx7OzbziuC7sK89m2gdPlNNSKN62ELbS+IKaYHGCj4N36f
 wSIBcCinQuJvWTIHbWoPyD85X8bI446092laozRVvvh0ZWlpKCD/NNO/74UCjQ/x
 V/X7biLJbsPj7i/KzwqdpqhCkIsTOp0DpWTlxuVdTZHaIzGQUseKLmAtuiu8NzKW
 SFWbkEwTxSuw2PPLgWZ9tSNxPK753ugpYK/1iF0G0G7jC0+5DfJKsQG01HZ4/pv7
 KvnlSLhAww+dGT0ZP40sYwnHfoT8Hf7uRD1H89DROqNB7Gb3N8IPXWWS7SQ1rPz5
 DxA7VL+z9HLoj5E4tbq6jEW3ml+0A==
X-ME-Sender: <xms:utaAXSX9bRzvomLb8uN1qmKgYsdFouF-Oc4XJR_mi5D6p5XyIWuYKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeigdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecuogfrhhhishhhihhnghdqkfhppfgvthifohhrkhculd
 eftddtmdenucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhm
 pefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrg
 hinheplhhisggvrhgrphgrhidrtghomhdprghlshgrqdhprhhojhgvtghtrdhorhhgpdhp
 rghtrhgvohhnrdgtohhmnecukfhppeduleeirddvgeegrdduledurdduvddvnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfihenucevlhhushhtvghrufhi
 iigvpedt
X-ME-Proxy: <xmx:utaAXdVrQ7Rm-OFoaX7Fw77ifbDX9MkzvaYFhVVa4WGAHa3lLS2Row>
 <xmx:utaAXa8-cshcRnW1ngyZOTN3p8kAblMIq2HnRQaPmaNy5b_5FsYuqg>
 <xmx:utaAXVbfK13Ig6TH4a8xOSXNOSdNy2aAI9OuEECByuhL8qJrmXcV9g>
 <xmx:utaAXUpy5Eio2DuWapKco8KKa_Wj-fp7Mnfgilyn0AEeHi3Liqz4rQ>
Received: from laptop (unknown [196.244.191.122])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B43080059;
 Tue, 17 Sep 2019 08:51:05 -0400 (EDT)
Message-ID: <365e4bcc033c151076140471225db51c80808b7f.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: frederik <frederik@ofb.net>
Date: Tue, 17 Sep 2019 15:51:01 +0300
In-Reply-To: <20190910173345.63bv2xa4vlkxicxj@localhost>
References: <20190904164706.gwjbcywbj7emnwvr@localhost>
 <s5hv9u19x2f.wl-tiwai@suse.de> <20190910173345.63bv2xa4vlkxicxj@localhost>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] parameter for pulse device?
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

On Tue, 2019-09-10 at 10:33 -0700, frederik@ofb.net wrote:
> On Mon, Sep 09, 2019 at 07:52:24PM +0200, Takashi Iwai wrote:
> > It depends on how pcm.pulse is defined.  If it's defined to take an
> > argument, it can work like that.  (Or sometimes you may need to pass
> > the argument explicitly like "pulse:{device=mointor}".)
> > 
> > The standard pcm.pulse definition provided in alsa-plugins repo
> > doesn't take the argument, and that can be the reason.
> 
> Thank you Takashi. Would it be easy to change alsa-plugins so that it
> takes an argument? Is there a chance that this change would be
> accepted?
> 
> If you can point me to the section of code in e.g. "plughw" where
> argument parsing is done, then I would probably end up modifying
> alsa-plugins myself, just to simplify what I am doing.

This commit might be instructive:
https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=3c199a0d199f0fae78c9c1b19c11878a6134b3a8

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
