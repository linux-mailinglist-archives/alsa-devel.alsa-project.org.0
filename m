Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A19340C1FA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 10:46:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EF0617CF;
	Wed, 15 Sep 2021 10:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EF0617CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631695579;
	bh=dKAZ/IJ5FY5dxVRmNKjIMIuHkA4Szv63UFxfSKJopN8=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=BGELVce0rrZk5OKLREC6T7smhU7uiLwgFarmfi4ekbSmcbfLiayDwyx0nZmp5oysY
	 vavvmGTv0Qu+qB1a2Lm1esXGaPQH24IVVId2LHhYnB9VpT3aGXRjNGp92vLSLETK3B
	 Xsd1y6sFBvNBEnUrSgTnI0NL+wKVKX2PwxtH0+yA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15E74F802E8;
	Wed, 15 Sep 2021 10:45:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B87E5F8027C; Wed, 15 Sep 2021 10:44:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 792B3F800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 10:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 792B3F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="ltcGwYXf"
Date: Wed, 15 Sep 2021 08:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1631695493;
 bh=PmMMW/PMwCy83iN7ibnySmyUiOmGviDzgbB2tjIIN1E=;
 h=Date:To:From:Reply-To:Subject:From;
 b=ltcGwYXfpW/XOMsYsLlLxpRnJGLQgxHHZ49j+m6sNyd7MJe6y+62dSuPL+xCccAp1
 SHPsCZvfyv+ivUpfmzLKxPNbCP7FWAMfA//PConl0XBB8iFao6nWm3EetqHc2IuQL6
 s3vaqszhe+6/YCNFAhPGUx4j4z5CNoGj4nUcMBg0=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Ryan McClue <re.mcclue@protonmail.com>
Subject: Location Of _snd_ctl_ops Definitions
Message-ID: <F8QtqhEtr7zd-TLTxx_4bX0GAXvq-griyYIyEpXrRybmRihHHpwt5nZUCn97mDEbJSW9TTesUMmwmFUukYEjWnGsCYi70LZhg6BA6iF9BMQ=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: Ryan McClue <re.mcclue@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

VGhlIHN0cnVjdCBfc25kX2N0bF9vcHMgY29udGFpbnMgYSBudW1iZXIgb2YgZnVuY3Rpb24gcG9p
bnRlcnMuCldoZXJlIGFyZSB0aGVzZSBmdW5jdGlvbnMgZGVmaW5lZCBpbiB0aGUgYWxzYS1saWIg
c291cmNlIHRyZWUsIGUuZyBpbnQgKCpzdWJzY3JpYmVfZXZlbnRzKShzbmRfY3RsX3QgKmhhbmRs
ZSwgaW50IHN1YnNjcmliZSkKCi0tClJ5YW4gTWNDbHVlLCBTeWRuZXk=
