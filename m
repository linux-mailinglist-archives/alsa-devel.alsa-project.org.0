Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E17691D303B
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 14:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BC5C1681;
	Thu, 14 May 2020 14:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BC5C1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589460409;
	bh=v7cPFaO4kK7Zs87lVIL/zERszLa3A1W3zQEDFM4/azc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bTkYDHTg+0o5jVOwZHijp8DB9gfgRlVSN7elXQDk/gPF0Gj0HOoG41xpUGBCYIUgg
	 4gGva7tHBSClW1+/eY+ZnYMwiUSmZ8bfwl/VvZlUAUX4nwLGBk3xswZecj20OzIaEu
	 SsKmK7cuj7MWoXdGBmh/gV80hEGkKTAmZan8mta4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43368F80299;
	Thu, 14 May 2020 14:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AC32F80292; Thu, 14 May 2020 14:43:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44A0AF8028F
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 14:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44A0AF8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EXWf9rqV"
Received: by mail-wm1-x342.google.com with SMTP id w19so17714055wmc.1
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5528EI9vmR3zRoZjoDmz5h0VbxtL0f47zTjCRlw8gwk=;
 b=EXWf9rqVpttbzvJV2VsY1Vj8+lle5TKiWfN5ZNt6FyDsS28M12N2StM5cUxyTHy2OT
 R+R1WEIGUQ0MI34TeJE5TR0Vxp8XANMI4JaF9/knkzrpksz82id9O7OGII9L7HgRQoCK
 bZUtL4z6ZpXwfCk2R4G3ahWx7+R7738JTFApceb/uGYG6B5uEz+j2XYFHXEMOzK/Xeld
 /goqzxryXlrQ1OvK9w8hzMLYc7hHR0uYoQVWAacgsRkeX+sN49d9pB++Mg+iawl/0Xkb
 S2+eE3Nni6H+0ZAPxLLumo7uZvGLGDyJhqztnwmnRGob4hXywtTMv2qTyKYVO2s8SSy9
 0Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5528EI9vmR3zRoZjoDmz5h0VbxtL0f47zTjCRlw8gwk=;
 b=ivngpFWJk4s9iiWPvWjIQ0GtzHuRxLktW9vnr1mbRl1l+U7n3UZN9PZpo3r9yUFgLb
 VGxaaVu4Inq5M9j8zYOa3FJt3Du6TZMrhIH7VC1L6pFilGsozi2buLVVMz+mriK3HuRS
 Z34dOgukcUBfpAkJhJfAAP8H6DIgLxwlh6vTeAVxVpmSC59RnsETO2LM/iAX9Bkm7HBF
 C/gWCUsfPpoL2G77brHgsCTlD8CumJMOoQ9GmUd9BCL+jzpuu84IImtjYwLl12dir1Tx
 WlffxxJt9xyGsb2IAVKJkI5YRcY1AAbbD0NmQr9Y/bGnhaB3zdjPkDrVcy1Kb10GywZn
 s2tA==
X-Gm-Message-State: AGi0PubR/nmic4qtj8tYug46wX/9blOoo0/mD+77yl+tzFKhMTMJCplL
 zfWzcL2O9f8bvgJZuK4UIqyxgjZ3
X-Google-Smtp-Source: APiQypIoJrAfmS0UJbvd33MwBHyfJrATYhcNAZ3mYwwqAeRfG1OxndrzHc+b6Ck3gbNlKoCbRpjXnQ==
X-Received: by 2002:a1c:7513:: with SMTP id o19mr36443868wmc.104.1589460221030; 
 Thu, 14 May 2020 05:43:41 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id w15sm3767092wrl.73.2020.05.14.05.43.40
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:43:40 -0700 (PDT)
Date: Thu, 14 May 2020 12:43:11 +0000
From: sylvain.bertrand@gmail.com
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] fix snd_pcm_drain() excluding SETUP state from valid
 states
Message-ID: <20200514124311.GA1308@freedom>
References: <20200502193311.GA19340@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200502193311.GA19340@freedom>
User-Agent: Mutt/ (2018-04-13)
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

ping?

-- 
Sylvain
