Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E81192FAA
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 18:46:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40E311678;
	Wed, 25 Mar 2020 18:45:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40E311678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585158386;
	bh=oSit7F6lkqSGVqjpkLsl8p15MmlIg/RTQdEDnUtlgZs=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARnJ7R0I5PhEa1UTXLKbwSlby1eIgmFnP1hrWbEg4fvxrT0+aEgWx/aDVrhYmI5YO
	 shDiw4tUWdxcX5G1fLEzWZhDMpqB6m9npRgRoSc5BVJuS7eGau9Vp0xRPgyPF9fCSS
	 fB96r9hbyBdB6MZR87nZ9I17eUIh8v4AmRHZ9uVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4727EF8015A;
	Wed, 25 Mar 2020 18:44:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46AC2F80158; Wed, 25 Mar 2020 18:44:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AC2AF8011E
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 18:44:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AC2AF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DJTTxJ4A"
Received: by mail-wm1-x335.google.com with SMTP id b12so3465506wmj.3
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5rXBg+iydjE1cPztD7rnhgHv8Sfifo3FaAFZXVEFMeE=;
 b=DJTTxJ4AVsEB/O1jhPrSnuPmusRUPMCZNMvD3o3rSm9TG9q/LWiJ0HrYJviPZEQ/lL
 wiW67wE4Vroz+1z7r7YRgK/rL3Bvcg5V96F8nP0AztjTTxErM8dSwYTXgwT9Rh8LqAgX
 mlwaFymvnIGx2v9ThIMaoAmeWTaAamBJ5tQOLISHS2rlYqvqmGjGNg1jnHRHeNAp7d6u
 LZI0eS/ZUVGMrT41UJMyfSH8w9LXi1bqT/o4dSEJ9qRTpKNcQbzBxPPu3CIEeCYty1N7
 e7XekUjM7ZnK0qiwiYjM9GCCZgfmOPnxgFgDiwf1Pfu3zJuUFDC5avTxE5NlLyfLVvl8
 RnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5rXBg+iydjE1cPztD7rnhgHv8Sfifo3FaAFZXVEFMeE=;
 b=WNx4Fb7Q05QziLe9BRU+wuFhpS+PKCWJbQ57Hyaa9lzx9O43kfCX/DMbJ1sMEMRWnq
 DCClzeNahv37RmJQOrikWTPakiMrVY3VtW7youRvjQ6l4Iskr53nF3WAh3ayeQQ9Gv8y
 ocQuouwYmTzl9obNB2P+8oa5hkQX992ULeRqVKyv7yids33texbNaFwG7Y0igZjdGRox
 grV3Jgxg+XHOJMaFMaepN26UzxRJW1onuqoFFU9CQeRHXCm5GKyMocHivCAmSFYHSqXT
 epugJs8vO9NYPR+CqOjoBE6Fkjazgq/kHb/6LelCMP+apbMs7+5EkBAdXlpUzkCK35QO
 5Pwg==
X-Gm-Message-State: ANhLgQ05LYawjV8cRbl6uydxKnwcOjFIhIS5AzkpB3oUPh8RvYfBEMTA
 UKi1OS7vn03T42oSiyiLh3axZvCw
X-Google-Smtp-Source: ADFU+vu89NSVXtZVNz4mZ1YdsHaCPTEUzSqh5PcacitSF0Tt/P/HmjNg50rYgVYZC6kHrZAtfb2qKA==
X-Received: by 2002:a1c:2c85:: with SMTP id s127mr4572283wms.18.1585158277621; 
 Wed, 25 Mar 2020 10:44:37 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id a13sm35398740wrh.80.2020.03.25.10.44.36
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 10:44:37 -0700 (PDT)
Date: Wed, 25 Mar 2020 17:44:19 +0000
From: sylvain.bertrand@gmail.com
To: alsa-devel@alsa-project.org
Subject: sw_params for a direct-ed(dmix) hw pcm
Message-ID: <20200325174419.GA1224@freedom>
References: <20200321155303.GB357@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200321155303.GB357@freedom>
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

Hi,

On this issue, I am doing something fundamentaly wrong, but I don't see how to
do it right.

While configuring a pcm, I should not use sw_params if it is a "direct-ed"
(direct::dmix) real hw pcm: in pcm_direct.c, snd_pcm_direct_sw_params
function is empty and it seems coherent with the fact the real hw pcm is
actually shared and was probably already configured.

How do I know a pcm is actually a "pipeline" of pcms which ends up with a
"direct-ed" real hw pcm? That would tell my code how to behave regarding
sw_params usage.

Is this related to the "topology" and "ucm" apis?

regards,

-- 
Sylvain
