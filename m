Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF113C6A8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 15:54:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 268CB17AA;
	Wed, 15 Jan 2020 15:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 268CB17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579100073;
	bh=uqrwwcoUU46ap0zjdE8PMsICy2vQeCutUe740cIw/78=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eXlVfCPj5/pR3ZjYq+wvISxwPwo50QYQMjca/mNUkGN0FJn6b0afBHPHElQS4KoN6
	 vRbSqoX9n86HhZRMc7yoGCgUh4kn82tVrNyGhkVFFLBc1VNiSdgq/9jshOhTQMqSi6
	 0B4JYJ6c12DoCozxnESp8cWXj0Lc45g+7XNMCm2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07208F801EB;
	Wed, 15 Jan 2020 15:52:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32CF9F801EB; Wed, 15 Jan 2020 15:52:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0CDFF800E9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 15:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0CDFF800E9
IronPort-SDR: 8tmAY/Rwf9VwTq3FV25rHYhD5uVUP/CpREY+lVL8+Sz1UVCHhwLqE3Jj5V03GADVb+7+ZP1hOO
 XvaNFrV/2CWGR55nZvUGsjUjKxkWFbOS8l+3KNw8gt5+lkwXE6VhnUEtlATu+ANx8awMzWAqC6
 hJHJYZjWZZHjGd9T8U45WEWwIhGfscqnUz/LolSN0tM80QAb1RWhVRIFnKNIy7ZWmAvYHmkVBz
 Obx5ePVWCJR1HICCTtf3BgvKux/wUOTSN6G8jI+Kbcn8svhobb7969ZWw3iGVjhgYgGU5s5ujN
 ZBM=
X-IronPort-AV: E=Sophos;i="5.70,322,1574118000"; 
   d="scan'208";a="4440738"
Date: Wed, 15 Jan 2020 15:52:34 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
In-Reply-To: <7ae52bb6-1af4-897f-7de1-34196d0ed1f0@linux.intel.com>
Message-ID: <alpine.DEB.2.20.2001151550140.9118@lnxricardw1.se.axis.com>
References: <7ae52bb6-1af4-897f-7de1-34196d0ed1f0@linux.intel.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX03.axis.com (10.0.5.17)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] arecord: buffer-size dependency on period-size and
 other params
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


On Wed, 15 Jan 2020, Rajwa, Marcin wrote:

> level). So to be specific I issue such command: arecod -Dplughw:0,8 -r
> 16000 -c 2 -f S24_LE --buffer_size 1280000 tmp.wav -vvv. The arecord
> response for this is buffer size of 31992 frames, 255936 bytes. Now let
> me also tell the buffer size of 1280000 bytes is the maximum buffer size
> our driver allows, likewise max period is 268800 bytes. Now if inside

Not an answer to your problem, but just a note: according to arecord -h, 
the --buffer_size parameter is in frames (in your case, with S24_LE and 2 
channels, the frame size is 4*2 = 8 bytes), not bytes.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
