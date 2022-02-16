Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B404B8DFD
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 17:28:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2DF31A95;
	Wed, 16 Feb 2022 17:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2DF31A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645028937;
	bh=j8dV14i1eoNfCK4Fl8Sr3o1HodSN1gCVTU0IMDEUr6M=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GUFVxIxY+TMt0w4SNgNZnFETcmVue1I2U+R95Jg1nQ0718l4kX+rvm3ymwWzWsd3a
	 3paVOh/yP8BrN+BT3km2iJjU4xP5+PLyj8cFNQF2bSJ6DjQKWaMONbYrr3vBZFg87i
	 q/HPaNM3lpzvzAP7A8h9Qm84rcwBLatLLoz+ccXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37CA8F800C0;
	Wed, 16 Feb 2022 17:27:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBDBBF800C0; Wed, 16 Feb 2022 17:27:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F034F800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 17:27:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F034F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="VYA6F/LO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1645028866;
 x=1676564866; h=date:from:to:subject:message-id:mime-version;
 bh=q3D8fqL2IRSQkeJFL+oSAZfd2OFZuCFrRPaM5AWuSGs=;
 b=VYA6F/LOLw6/DXc3rVzaUXhpFUowq9+su2Sl6CGqJUYkYZR/glJ9GKl4
 kPV+iiYOnjZ1Q1c0Ni4mHsOblWdP2Iz7psILtBtQ5IhJb+HkGISMVIwia
 iMr+Z7CT6fmIgwmybObKp5yluFvKN821SKQIqdO3bCq+pL+a8MQRELl+j
 Z6zjNL0VYxmsyOvunrlieZoyfRXeGvs6aUBVToNQV8j7HsfCdaOgd4d3U
 FTXD7r6d1aBA2Dxspy5D5MmI6WCmzVByh2CzQ5ft44xXnK7QphcLcSaQP
 ddktNzlNhQ+V6yzdh3zfxikfPcKr5rezlRcwIuX280pwD4y40gbJ/uEJH w==;
Date: Wed, 16 Feb 2022 17:27:34 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: alsa-devel <alsa-devel@alsa-project.org>
Subject: Multiple codecs of the same type on the same card
Message-ID: <alpine.DEB.2.21.2202161722560.17949@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail07w.axis.com
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


When adding codecs to a card, all the controls of each individual codec 
are visible as controls for the complete card. But how does one handle the 
case of multiple codecs of the same type, for instance two identical 
codecs being used in TDM mode to create a multi channel card? Is there 
some method for resolving the fact that the control names naturally 
conflict?

Or is this expected to be resolved in the machine driver? Currently I've 
been using simple-card, but perhaps this type of configuration is too 
advanced to be resolved for that, and a specialized machine driver is 
needed?

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
