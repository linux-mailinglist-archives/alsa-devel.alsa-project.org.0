Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3BE82637B
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jan 2024 09:54:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7B27EAF;
	Sun,  7 Jan 2024 09:54:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7B27EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704617680;
	bh=h6TY00DxFGxPDMy5/CpnzgNBdPsBqVaQkTfYQFBVgEU=;
	h=Date:From:To:Subject:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZIjzEs717bEBo44dpMVv9GwmvdxGCurDXsQv2z9lE9nnwBTG1+F7FhvVZVvqT2VPD
	 /wmYWFMRJyk8bSmfXWY0G3a6ePAK3eBI5HXs41uXChqLyctFv3V9QzdeUYtDFpsGHv
	 zOJ3el8M3jXYMc8WTLiyuGShjJOuTZl/dH/vNBLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E87FF80570; Sun,  7 Jan 2024 09:54:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30F6FF8057F;
	Sun,  7 Jan 2024 09:54:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61256F804B0; Thu,  4 Jan 2024 22:43:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFB28F80086
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 22:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFB28F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256
 header.s=sasl header.b=nRfqwt74
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 5086E1E7FF9
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 16:42:48 -0500 (EST)
	(envelope-from joelz@pobox.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:subject:message-id:reply-to:mime-version:content-type; s=
	sasl; bh=h6TY00DxFGxPDMy5/CpnzgNBdPsBqVaQkTfYQFBVgEU=; b=nRfqwt7
	47HOESnsiK2H4Sd0X72toUCW4ifTjkwbCoRvmGCy6N3iiRqCTijCFqHzbxksGKpR
	066E5VZH8txv4cvzt2IP2JTiu9W/IRLn+5pvadeu7YvzqdAtcLViqQerx8wjcNXm
	u29eR5ubpWFu0ShOAWRUPl7Kzhv82GtL9UcQ=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 478911E7FF8
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 16:42:48 -0500 (EST)
	(envelope-from joelz@pobox.com)
Received: from sprite (unknown [66.8.171.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id A55731E7FF7
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 16:42:47 -0500 (EST)
	(envelope-from joelz@pobox.com)
Received: from jroth by sprite with local (Exim 4.96)
	(envelope-from <joelz@pobox.com>)
	id 1rLVUC-00008s-0G
	for alsa-devel@alsa-project.org;
	Thu, 04 Jan 2024 11:42:44 -1000
Date: Thu, 4 Jan 2024 11:42:44 -1000
From: Joel Roth <joelz@pobox.com>
To: alsa-devel@alsa-project.org
Subject: Intel audio controller: Loss of HDMI output between kernel versions
Message-ID: <20240104214244.h2j4kkgnwmckgaip@sprite>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Pobox-Relay-ID: 
 339D745C-AB4A-11EE-9BBC-25B3960A682E-04347428!pb-smtp2.pobox.com
X-MailFrom: joelz@pobox.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BEJDYEMZ53HADAYJDMGRUHZAUMWNZY4X
X-Message-ID-Hash: BEJDYEMZ53HADAYJDMGRUHZAUMWNZY4X
X-Mailman-Approved-At: Sun, 07 Jan 2024 08:53:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: Joel Roth <joelz@pobox.com>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BEJDYEMZ53HADAYJDMGRUHZAUMWNZY4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Will be grateful for any suggestions.

My soundcard as reported by lspci:

00:1f.3 Audio device: Intel Corporation Cannon Point-LP High Definition Audio Controller (rev 30)

I use the asoundrc below to route audio to both
the analog output and the HDMI connector. 

With Debian kernel 6.0.0-6-amd64 I get sound at
both outputs. With version 6.0.1-10-amd64 
there is no HDMI output. 

pcm.hdmi_out {
	type hw
	card 0
	device 7
}
pcm.analog {
	type hw
	card 0
	device 0
}

	
pcm.hdmi_dmix {
    type dmix
    ipc_key 1024
    ipc_perm 0666 # allow other users
    slave.pcm "hdmi_out"
    slave {
        period_time 0
        period_size 1024
        buffer_size 4096
        channels 2 # must match bindings
    }
    bindings {
        0 0
        1 1
    }
}

pcm.analog_dmix {
    type dmix
    ipc_key 2048
    ipc_perm 0666 # allow other users
    slave.pcm "analog"
    slave {
        period_time 0
        period_size 1024
        buffer_size 4096
        channels 2 # must match bindings
    }
    bindings {
        0 0
        1 1
    }
}

pcm.!default {
    type asym
    playback.pcm "out"
}

# Multi
pcm.out {
    type plug
    slave.pcm {
        type multi
        slaves {
            a { channels 2 pcm hdmi_dmix }
            b { channels 2 pcm analog_dmix }
        }
        bindings {
            0 { slave a channel 0 }
            1 { slave a channel 1 }
            2 { slave b channel 0 }
            3 { slave b channel 1 }
        }
    }
    ttable [
        [ 1 0 1 0 ]   # left  -> a.left,  b.left
        [ 0 1 0 1 ]   # right -> a.right, b.right
    ]
}

-- 
Joel Roth
