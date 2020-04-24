Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1B91B7124
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 11:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 825CA16C0;
	Fri, 24 Apr 2020 11:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 825CA16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587721482;
	bh=JjIoxWVcUliw/YoRHEQcFjgb5wxq6gpTA1cgjePV/R0=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oR9VLbrQ5EsRGHoO9FnxNqdmz0g1oixQ/i6/OaNTvKCvmFsjUHzcxVN9lNHr2WDvK
	 Ez2sWllKm3AEsadCB4a7+tQL5xQX9o2qZq69wO/c+rOXM6JwDIVxb9lJNwX60fZWGM
	 NA12P6Sbei9h/HXltg8tfUT9buiScBIi9zrdPYSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF6A5F800BE;
	Fri, 24 Apr 2020 11:42:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FF4FF80142; Fri, 24 Apr 2020 11:42:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63D64F800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 11:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D64F800BE
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id A8DE1A1F2B0B3
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 11:42:45 +0200 (CEST)
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ee-99CBHGFk for <alsa-devel@alsa-project.org>;
 Fri, 24 Apr 2020 11:42:40 +0200 (CEST)
Received: from [192.168.105.191] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 57214A1755F1F
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 11:42:40 +0200 (CEST)
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: High-bandwidth/multiple transactions per microframe in usb audio?
Message-ID: <ee53ad0d-2d61-545b-7afd-64a5ed37c702@ivitera.com>
Date: Fri, 24 Apr 2020 11:42:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Please does the current USB audio driver support multiple transactions
per microframe (high-bandwidth mode)? I could not find it in endpoint.c
but it may be there or somewhere else :-)

Thanks a lot,

Pavel.
