Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B1719A87
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 11:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 277AC1ABF;
	Fri, 10 May 2019 11:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 277AC1ABF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557480185;
	bh=DhfV0Lhyu8tFzWGdhvkXW4+GeyuRGPTEqRuxm0rXTdU=;
	h=References:To:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aGHB1F7vsd+okY7UKwk+6hSy8I1tR/F0TrOU1BdlLL2FCHoYGJUsvLr/vwUHAfzS5
	 FpFUrMe6jzAH2iEQdg7CjEe1vMdHNBkN8HQrH2S6qpcr8CHhXsWgjhFD1a9aQv0PQx
	 8mg/qObdNhr/Rt+l0IO6WkKX2zfXUelMBVGo5gZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32912F8970F;
	Fri, 10 May 2019 11:22:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99DF2F8970E; Fri, 10 May 2019 11:22:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A1DFF8073C
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 11:22:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4A75DA0042
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 11:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4A75DA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1557480126; bh=Qh5bZGqC8/WUkdfYV/lbs3C0mlAUqdU7nMlECcDVGbU=;
 h=Subject:References:To:From:Date:In-Reply-To:From;
 b=OkX5mRtihrTlnwN68x0iPHe6QEGXR3XZvU+Ou/Hi1VuHL7GHRkC5wkiIZLwGrCDAm
 w8pQnAlnDpr5lYATf/u79jAmmG7kkgY10g0dTxMlBO7gzY++jVzJunE/zn/MypKT3E
 8xy/nd6LiUS3eOykJpF8Q0bwBiNTsjmtGZBmHq0w=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 11:22:05 +0200 (CEST)
References: <ea89d8be-8a6e-4d53-7ff3-09eece936993@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
X-Forwarded-Message-Id: <ea89d8be-8a6e-4d53-7ff3-09eece936993@perex.cz>
Message-ID: <ed96d068-79ae-18ab-e24e-b3ac07897cfc@perex.cz>
Date: Fri, 10 May 2019 11:22:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ea89d8be-8a6e-4d53-7ff3-09eece936993@perex.cz>
Content-Language: en-US
Subject: [alsa-devel] ALSA 1.1.9 release
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

Hello all,

  new ALSA userspace packages were released. You may download them from
the ALSA website http://www.alsa-project.org or directly from the FTP
server ftp://ftp.alsa-project.org/pub .

Full list of changes:

  http://www.alsa-project.org/main/index.php/Changes_v1.1.8_v1.1.9

				Have fun,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
