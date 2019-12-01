Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3EB10E022
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Dec 2019 03:04:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 505CA1693;
	Sun,  1 Dec 2019 03:04:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 505CA1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575165896;
	bh=S5xxbQCYc6GecLnMWo+VZRxqOl8N+rLlje8NahYRvZk=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tp1GJHf4Jr34p3mtwCUb5y7TQ5nEMZUoil6Vj0hDOxJpdboBr2lZtrOcvazWDqIE7
	 6wyYamavDS13NN9NMTOvstOeQ9I4AasvtfCJkii5cQTQZrIhSqF6mlE6tBIb7PRYYs
	 /fvEY7xIBrjEYd8rrDDhp1ff2poiLEkFp0Fvjxo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2F2CF80149;
	Sun,  1 Dec 2019 03:03:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B25C4F80148; Sun,  1 Dec 2019 03:03:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D7A4AF800B3
 for <alsa-devel@alsa-project.org>; Sun,  1 Dec 2019 03:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A4AF800B3
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1575165784857050896-webhooks-bot@alsa-project.org>
References: <1575165784857050896-webhooks-bot@alsa-project.org>
Message-Id: <20191201020308.B25C4F80148@alsa1.perex.cz>
Date: Sun,  1 Dec 2019 03:03:08 +0100 (CET)
Subject: [alsa-devel] regression: aplay -L missing pulse in 1.2.1
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

alsa-project/alsa-plugins issue #3 was opened from higuita:

Before 1.2, `aplay -L` showed a pulse pcm. After the commit 
https://github.com/alsa-project/alsa-plugins/commit/b0f9c353c7cc9cffb77e7a7b00545ad00f4599fb
pulse is missing from the pcm list. This may break some apps, war thunder (used fmod) game stopped seeing pulse and only tried to use alsa directly

if i comment out the below line in /usr/share/alsa/alsa.conf.d/50-pulseaudio.conf
`@args [ DEVICE ]`

`aplay -L` show again the pulse pcm

another workaround is to add this to the `/etc/asound.conf` :
```
pcm.!pulse {
    type pulse
    hint {
        show on
        description "PulseAudio Sound Server"
    }
}
```

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/3
Repository URL: https://github.com/alsa-project/alsa-plugins
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
