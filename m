Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1895441768B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 16:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB131654;
	Fri, 24 Sep 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB131654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632492401;
	bh=PeN+1bbRvG186MWbmzjKmNuAyo1rfNeKCrP3RFit45E=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fpvnpqseNdNSZbn2QYD64WA20+Zxhy5EKyIAV6DI6/3qP2vQmhVeV6mWMNNrs3oLh
	 fH9aPdasmAbar8dnZxtSGPMySwQLxuRIAKFuXblrfqXo0FC9zu/hd3XD+0ufxt8rT8
	 U3w58c8VL87YEG2gcsejROWipdThKh2Dlc+/FCYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D194CF804BB;
	Fri, 24 Sep 2021 16:05:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 020D2F802A0; Fri, 24 Sep 2021 16:05:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7E26F8013F
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 16:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7E26F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YTJjguu1"
Received: by mail-lf1-x134.google.com with SMTP id z24so41466222lfu.13
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 07:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=x9wrtFUSdTJMyo9s+DwcvyowK/JgILrZ56Zwsu6BpUM=;
 b=YTJjguu1roXomlwdGnYKOHOC4zz8BcvNZfJGJcivEP9auJITbgZsPhGEMCnKH+437A
 Lsy79kIduZNZV1dWtlXOpo/igo7kP3DCBmEHsEhu4L9y4KEOGNF6brIJVQu5V/Vo854y
 6sg/WYXV4kH0VUtmX7wC73wS6iMb6RfWZAlFvvceG1YgCfze2nCe4cs64q5mXRp5WGMF
 QX4sJnBLx5TKA/SiQuPrwfkd2FU8pVk0k1DrTixo4idCd8o+vBob0kTb3lxIkGYx9guN
 0InLszPRvXmtHI+EjDvYepjJr1W1fxhSOfTq9utkV1el647vull59kd6WUehqoGyRqx4
 /5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=x9wrtFUSdTJMyo9s+DwcvyowK/JgILrZ56Zwsu6BpUM=;
 b=nmTcoL7vJrEACwK7wI0clp6Bysa0OC+vmI2T0G2xE6HLawrsFJ7WUI8cm99Ok6Ygme
 c61ndhcU4SA61gGPECOUFrGGskzPXU1hRdXiI4ZIXXMMqTAWxmNYcpl0TahQKaOwORe3
 +hTBLjnJTGdYuPnMJ+3BcdgnlCUT0TiPSWajs9S1tcLNNt1gWGkz/X3KdBiWUKBU/bGv
 phuNQ4ydhW1q2mmRKlvI4aDRsbpmHOFUUdlHoJDLTFPSCU62zY0drvIB8JtRh0M8iYdM
 HDduvCk7hDGddxCRl68dCd/JFJAzcoZEb5HDW4/cin1RmVZKxXwZP/yVE4hzqUEx2I1G
 tVvA==
X-Gm-Message-State: AOAM530FYhWzrAPBknNLPhTQi9VsUcJ5tFCfvg3PNRUKvw2DsKFblyXI
 wRwm3gfVkJS5tXY55u9lCu/2v2AZMkdaXgYGJauLjBfD11o=
X-Google-Smtp-Source: ABdhPJz6+0oukF4ZycCIr3Aq95XEGRR+UXKQiCM4sMlEf0PEwnnBEPKXNLjlvlFS4sUFMQpu5cKSrEZOdHNPv7Xm1V8=
X-Received: by 2002:a05:6512:3d8f:: with SMTP id
 k15mr9339531lfv.430.1632492310378; 
 Fri, 24 Sep 2021 07:05:10 -0700 (PDT)
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Fri, 24 Sep 2021 19:34:59 +0530
Message-ID: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
Subject: ALSA kernel projects - for academic purposes
To: alsa-devel <alsa-devel@alsa-project.org>, 
 kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi all,


What small projects would you suggest to a novice with the ALSA
kernel. The aim is to develop a familiarity with the ALSA kernel
source code, and also to submit it for academic purposes.


-- 
Thanks,
Sekhar
