Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F677DBDC9
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 08:43:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A050615E2;
	Fri, 18 Oct 2019 08:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A050615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571381024;
	bh=L0fD1nAvgN8sfyU855p3IqPcZ+81Lv/gSN61DUWhLQw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=Ykv/vRjXgQjt9dfNGSiJGPJoVNwrRQHgbldhZ5N+m9B9YK7QUiV5qH4YUpQDSKNot
	 JaKo5BsO9qaBopT1HgQAD96KdezdRhvFRbAcmsCOGlcLKYcTTs441zJr9Tmxem3p6P
	 f6WrDjw7BLYhJ/KKiVlpGQOHKR+5V0cd6HxYQ1Mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F12F8036C;
	Fri, 18 Oct 2019 08:42:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 416FEF80362; Fri, 18 Oct 2019 08:41:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from egnor-li.ofb.net (egnor-li.ofb.net [IPv6:2600:3c01:e000:283::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C7C0F80322
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 08:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C7C0F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ofb.net header.i=@ofb.net
 header.b="qp8F5Yly"
Received: from ofb.net (163.242.197.104.bc.googleusercontent.com
 [104.197.242.163])
 by egnor-li.ofb.net (Postfix) with ESMTP id CC01F117FB8;
 Fri, 18 Oct 2019 06:41:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [173.239.75.234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by ofb.net (Postfix) with ESMTPSA id 7C0B83E959;
 Thu, 17 Oct 2019 23:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ofb.net; s=ofb;
 t=1571380911; bh=43RiLSRe3ncm9/0pD6LKKipwq9b89aLrqVYMVLUUr3s=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=qp8F5Ylynvq7oz7hqhBXZTU/ChZHtgkOoaDjbZbB/oWSCe0YaHjlkBmlTFD/QX/+B
 0sygWGOdmKg7F2+9OyeJUhsEFLRqdlRRiJnpDtNb+LnR6gvxSGcdDT2p9HbUjvelxu
 B3ImlLjcu2VRv0QcajSg0ZXaAHUw4AQ+26LpOIYkPNSSFx+vsrB0Odr/ON+eyPI0EM
 NxDF3IPf2aVzBPOCCfCvCsLDfu1PhjB6FCOv6iw9qhN+hDI8xjc9vrGr+7qiJTNpZ/
 3VdT8DBb95k5+7uVYuPEG88EaYIE9mRRt9HLc47u0kp2yv/k9eB/+uPShclKDX+nEc
 c4bstcp/ARLTw==
Received: from frederik by localhost.localdomain with local (Exim 4.92.2)
 (envelope-from <frederik@localhost.localdomain>)
 id 1iLLxO-00088u-7K; Thu, 17 Oct 2019 23:41:50 -0700
Date: Thu, 17 Oct 2019 23:41:49 -0700
From: frederik@ofb.net
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191018064149.hexdpjts7mjtwd7k@localhost>
References: <20190910173345.63bv2xa4vlkxicxj@localhost>
 <365e4bcc033c151076140471225db51c80808b7f.camel@iki.fi>
 <s5himprulnt.wl-tiwai@suse.de>
 <e294e2985eda906be3c3625235cc28643208dab2.camel@iki.fi>
 <s5hblvjukn6.wl-tiwai@suse.de>
 <20190919211244.buu3d6ey4k2dxyul@localhost>
 <7c81ae80233efb25b25f2d1f941e9c11acb3967b.camel@iki.fi>
 <s5hh857o1ik.wl-tiwai@suse.de>
 <20191015155202.bqcqzvvpeesfvuwg@localhost>
 <s5hblueh91h.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hblueh91h.wl-tiwai@suse.de>
User-Agent: NeoMutt/20180716
Cc: Tanu Kaskinen <tanuk@iki.fi>, alsa-devel@alsa-project.org
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
Reply-To: frederik@ofb.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

>OK, good to hear.  Now I applied the patch to git repo.

Thank you!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
