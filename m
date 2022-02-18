Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D04BB6B4
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Feb 2022 11:18:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3DE91707;
	Fri, 18 Feb 2022 11:17:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3DE91707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645179483;
	bh=vB/oxhLbPFSazdtfRv1kBQtHtz0kwmzU+Dpi82GR/3w=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmqxLEL0/ozqcFK5cbecd+fBUAvpLHbbB5mPMUFpM0SsU/C91GmeERz3pfwsf8Hoe
	 G9uHs9NfsscVP518KsOvrXTOj1IwRm1DFDFQ8hCsaEkJcHt74Q/8P+nV+v2OyhKPu0
	 JHT7VTwLOmeLkYJP0svHeQmLYVea/jsbIUNLNDxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B082F800CE;
	Fri, 18 Feb 2022 11:16:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E112F800CE; Fri, 18 Feb 2022 11:16:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAC64F800CE
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 11:16:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAC64F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="DDzaYjvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1645179411;
 x=1676715411;
 h=date:from:to:subject:in-reply-to:message-id:references:
 mime-version:content-transfer-encoding;
 bh=Z7ad0RHZLp0Qzf/z75G6yqCU8dGhaKRvST7dWOSl5Ys=;
 b=DDzaYjvTrHMniDaKiTQC20/IDFqsqccAhI23L3rEd+dIWlIYuoazj9fC
 VuX3qi0OnYTPmajGFTpdKMLEn4CUCeqLyI1Yv+ugXO4Xy7v9rBDmrLEOo
 uZ75Z2YLl+Du2Ddk69OmVRweG8PIzoqKrW/EbfNZ/lp35f2b1lRJO33Zy
 qeTRqlwIOY6f2PdlDABCwfXRs88gFQTfQ9tFhGDkVfNfqT3IeHmV6pbjv
 +FYExS1BLFQtbXhkxJOT/bxkXOqore1NXN3kpaQdrmb7eRa10U524Nfkn
 bEAaKyNKU/y9hbL226/XLeTiYkIg6u11RyhRPNBryLloEuJDCVxZgrr0i w==;
Date: Fri, 18 Feb 2022 11:16:42 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: alsa-devel <alsa-devel@alsa-project.org>
Subject: Re: Multiple codecs of the same type on the same card
In-Reply-To: <alpine.DEB.2.21.2202161722560.17949@lnxricardw1.se.axis.com>
Message-ID: <alpine.DEB.2.21.2202181113010.20061@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2202161722560.17949@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail07w.axis.com
 (10.20.40.13)
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


On Wed, 16 Feb 2022, Ricard Wanderlöf wrote:

> When adding codecs to a card, all the controls of each individual codec
> are visible as controls for the complete card. But how does one handle the
> case of multiple codecs of the same type, for instance two identical
> codecs being used in TDM mode to create a multi channel card? Is there
> some method for resolving the fact that the control names naturally
> conflict?

After not too much digging, I found the sound-name-prefix property which 
when added to the actual codec device node resolves this issue.

However, I'm still failing to get the following configuration to work: 

I've got two stereo codecs connected to the same DAI, in order to provide
4 channel operation. Is this something that should be possible to 
configure using simple-card, or do I need to write my own machine driver? 
As I understand, the configuration as such is supported by ALSA since a 
while back.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
