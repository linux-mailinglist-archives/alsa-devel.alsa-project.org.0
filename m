Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461185F3B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 12:08:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AC14852;
	Thu,  8 Aug 2019 12:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AC14852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565258922;
	bh=QeFH/wWnDyGegplYYmR1jA2Oj6hIYc0gLYhXgwJdtl0=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j1CcWVxbJhtSHJs3pr9Do4W6zHdjvRhzG7Kp/jYDWhkUhzR2zHoWrlNYcuE6TdVbM
	 o//TzUw8+IxbNg3sheZ03pBOTbuU64IStqJ9d+WKzB5YKnMVlY4q5lp4fvXq8ofiiO
	 R3nak7LZiPkgg8Yg4g7JqjUBbPA73qpZYm+5xkNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9406EF805A9;
	Thu,  8 Aug 2019 12:06:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85255F80534; Thu,  8 Aug 2019 12:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4397DF803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 12:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4397DF803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UgH7RxV0"
Received: by mail-ot1-x334.google.com with SMTP id q20so116145658otl.0
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lPMWfsyhUu1fhYDz8iik14vx6U/7DtTk5bPQ+rwecXw=;
 b=UgH7RxV0gPr1vT4Tj/xHzPgg8/ml7z6RSyhwFJfN0LBIMJ6GcrE7oM1t283EVu5MNu
 XdDiyPK0pahCirP0Vzv6YeHtJFZ6gSqKXgc/wlE1gCco3ozyqK7Y4nxAhZKtdH9DQ3BM
 2zuSYf3SIeS8ZJJe4X3a2pXdDz90iyrQebBt9k5ZVxIn8zJVYlXPiqm9gSOb1GWkJyvX
 DToai7waTAk7f1zhcSDz5PtsakftaNrnMfcuSQXkEgQ4nQp0F0OGyPF3u8bf5094/lWh
 BgYnQeAZNd9ENr/sdwKw0SIYpP47SnPsqmyUM5l13n/YWFUTBSBrgBWp2cvrSMEmItQj
 pcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lPMWfsyhUu1fhYDz8iik14vx6U/7DtTk5bPQ+rwecXw=;
 b=pd2dhOag9sa+MAyiT0EYoxT1foRRROELrioUm/rZUb6AeArJL9lT29LbBZbfCbFz29
 N34fQwuT5Ss9oOP/uqNdtD9Kyee7S7msNGxQgEomfgd3C4cCedOxPqT+BUIRyxAo8ZOS
 rxfSnLmqXJptDFeVZRyVdwGnmKGdlB4B8ZWQrSyZlmGw1fZ9YAZg3G4k8AHobsA8lJUx
 S1RfhVtzYT+38CUi3/KJnKgvtqbIj2gKqvBOaYaaE8d9OZpwDxu17NEWHXXPSs5oYe2o
 E6103Zihw8iDdhkg/UpklOWwTQHulTngg5IyGZjiNuQLwTK4Gm+bgGewZ/wKI/m6mQj7
 F4lA==
X-Gm-Message-State: APjAAAWSpe1E88G4Nhpbc+J9z/tDwZslVIj95RL+5UNfOoNwLQoxTSE3
 KmM4hCK0wNC3IFI2Xem2JVaVl8dH+e4DQqwt2jikBQ==
X-Google-Smtp-Source: APXvYqz+PaNy6g0ABzzPxdiIfQ0kNpX5OWvzyOf1WCXPOviBcNVYXBLdRpxhu6PiqVMonkxl6EBHnc/PyGrOhSPb+kE=
X-Received: by 2002:a6b:8f82:: with SMTP id r124mr3263178iod.6.1565258600405; 
 Thu, 08 Aug 2019 03:03:20 -0700 (PDT)
MIME-Version: 1.0
From: Aishwarya M <aishdhan986@gmail.com>
Date: Thu, 8 Aug 2019 15:33:09 +0530
Message-ID: <CAGKLxt+7MmrkUBf6Y9ugb7JZY5h9FcmzQJsv8AwEBswOFPaP0g@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Thu, 08 Aug 2019 12:06:09 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Regarding alsa snd_pcm_rewind()
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

Greetings,

I am currently working on an AudioPlayer which can play, pause, seek
forward, seek backward the audio using ALSA. For seek forward and backward
i would like to know if we can employ alsa's snd_pcm_rewind() and
snd_pcm_forward() ? Please could you explain how exactly i can use it for
my AudioPlayer application.

Looking forward to hearing from you.

Thank you.

Aishwarya M
aishdhan986@gmail.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
