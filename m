Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F41125069
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 19:15:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 509591615;
	Wed, 18 Dec 2019 19:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 509591615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576692900;
	bh=j2rTp8ORon7qODZrDIpTzLiB0gGQCTeDlYvJcPbXu6o=;
	h=References:From:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Up2p6pe0aqLWhGXVFj4Akg8hYxN58GeOGGF3w3LoSWTckb/ZXpJnDdKOpvC/0bQmA
	 lSXAUl+WX/b8HJWd507EHWyvzpJIIMrQ/nsjRtTNAXMojYCaliLbZCyRNr8rw+cwd+
	 NlavQRoXvuTfeHKQ0+uswHHpzAdjP/Z3rUbgmiUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C03F80255;
	Wed, 18 Dec 2019 19:13:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51A6FF8022C; Wed, 18 Dec 2019 19:13:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A947BF80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 19:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A947BF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="UW4z10ZF"
Received: by mail-wr1-x442.google.com with SMTP id y11so3331936wrt.6
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 10:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=s6pr6X3YZWixb8igAL5ZzP135162lw6kkNkrAE5nvDY=;
 b=UW4z10ZFcOooL2c6GdzIvB9hmP5SseKfAI01lmvsAEbvOsrbWRmG8k+UDXtTLgnaM9
 gm2KqSYCyAOdc4YVMUZe4K319U183tNcXM872/5G0/gAs1i+iaUHQKiMKr747n6P7H1A
 YHXU6qxJ3oy4K+nWuCo6q0/101Zo9ssfrjX2grmDbtYOxTZkVGyQ+qH6dRHobBqWxa1M
 nIIVB01E33kFsHgdbAF+OVbVhtPJBpgERrJzzZG7WXk1APl7JNGY2Fp/gqFhtL2W7/LP
 Z/+75Nq94y6KhsbiFMDLZB1RmH3ScSQQX3cQaFbNa3OaQN7mg5QU2gqXUUQP/vSOqS5w
 ezMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=s6pr6X3YZWixb8igAL5ZzP135162lw6kkNkrAE5nvDY=;
 b=cBhV4P/CMAqC/Za5KEGYLBHF8OCsqeHlxy70c2INdgHL281R5fEazHcMuRJg27hPoT
 cU06HCBjDOPjaqLxDYLBqCJat1aOEOPtyXpWLL08UGeYL0ZluzwxiD3KvNKLCpESI5MO
 uoKIF6Tj+tx8TyJNn5PM7wabEeDNs6lrFp7GxgYbLuMoIsocJXVY3TT9THiraJbPY6Ms
 5ZZXiCdh5JJzi0C/r2uCrl9/M78nekhgaisDKB3jGLqs3DBfbjwYB7i3zSWwdk2jBB0Q
 cMeTYmlVfOwbCKvlobB7t1vXQATy2zQS5lkDYkusLa8XA0ef4TJpWj7uPLfFOnhy37n5
 3KDw==
X-Gm-Message-State: APjAAAXzuxGqdiHzX0xVmKhuzedYcZLCUIBC7kPUr8y1Akn/IXOxiLEq
 +jSERKn+5BHcm87g9SLRrhM2pg==
X-Google-Smtp-Source: APXvYqwzBRl3g+BhMlJHg5Zu4pGS3x1Uk52GVE05baVV87Pi+U0SnH3/RibUeAZUwELOwUZoc+WBQQ==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr4372382wrc.175.1576692790684; 
 Wed, 18 Dec 2019 10:13:10 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id h2sm3396271wrv.66.2019.12.18.10.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 10:13:09 -0800 (PST)
References: <20191218172420.1199117-1-jbrunet@baylibre.com>
 <20191218172420.1199117-3-jbrunet@baylibre.com>
 <20191218175031.GM3219@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
In-reply-to: <20191218175031.GM3219@sirena.org.uk>
Date: Wed, 18 Dec 2019 19:13:08 +0100
Message-ID: <1jimmdbiyz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 2/4] ASoC: meson: axg-fifo: add fifo depth
	to the bindings documentation
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


On Wed 18 Dec 2019 at 18:50, Mark Brown <broonie@kernel.org> wrote:

> On Wed, Dec 18, 2019 at 06:24:18PM +0100, Jerome Brunet wrote:
>
>> Add a new property with the depth of the fifo in bytes. This is useful
>> since some instance of the fifo, even on the same SoC, may have different
>> depth. The depth is useful is set some parameters of the fifo.
>
> Can't we figure this out from the compatible strings?  They look SoC
> specific (which is good).  That means we don't need to add new
> properties for each quirk that separates the variants.

I don't think it would be appropriate in this case:

If I take the example of TODDR fifos on the SM1 SoC;
All the TODDR fifo on this SoC are compatible with the same driver and use:

compatible = "amlogic,sm1-toddr", "amlogic,axg-toddr";

However instance A on this SoC has a 8192B fifo while instance B, C and D
have 256B fifo. Same goes for the other SoC and also FRDDR fifos.

To store this difference using compatible I would have to add 1 compatible
string for each "A" instance of each FRDDR and TODDR of each SoC. At the
moment this would be 6 more compatible string for something that is really a
parameter ... This also shows that fifo depth is something the HW
manufacturer can tweak easily for each instances.

It would not scale which is why I went for a property.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
