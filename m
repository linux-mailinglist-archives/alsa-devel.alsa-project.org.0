Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D883FA04C0B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2025 23:10:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCCAF6035A;
	Tue,  7 Jan 2025 23:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCCAF6035A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736287849;
	bh=wBJ+wI+2LUlTSsW8QJ0Gd82eqbwMbvfF6mnJAJkx5mU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KQj4jJ2/F1WSX1SFaK2EF+1fcNM5w2/YpwLmpHKk8QP7RR8QonH6pDkuPQlC4V+Gv
	 ssPIVeaSJM/NSavLB80Ch6trTn0/aJ2lAZwusmj5NblF/gC/iAOecamms67KYkntrI
	 d1E+Fe00hLljqo1HnSe0IvrCg8y/scVAGlq4+/i0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 497E8F805B5; Tue,  7 Jan 2025 23:10:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35B51F805AF;
	Tue,  7 Jan 2025 23:10:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 418FFF802DB; Tue,  7 Jan 2025 23:10:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 974AFF80086
	for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2025 23:10:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 974AFF80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1736287809908450842-webhooks-bot@alsa-project.org>
References: <1736287809908450842-webhooks-bot@alsa-project.org>
Subject: aseqdump version 1.2.11, There are small bugs
Message-Id: <20250107221012.418FFF802DB@alsa1.perex.cz>
Date: Tue,  7 Jan 2025 23:10:12 +0100 (CET)
Message-ID-Hash: UHALDX3FCSYUHCYIBXKCJTHCL2A4UNDM
X-Message-ID-Hash: UHALDX3FCSYUHCYIBXKCJTHCL2A4UNDM
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHALDX3FCSYUHCYIBXKCJTHCL2A4UNDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #285 was opened from masahirokakishita:

Hello,

I found small bugs in aseqdump.c

static void dump_ump_midi2_event(const unsigned int *ump)
...
	case SND_UMP_MSG_PITCHBEND:
		printf("Channel pressure       %2d, value %s",
		       channel,
		       midi2_pitchbend(m->channel_pressure.data));
		break;

It is not "Channel pressure", but "Pitch Bend".

	case SND_UMP_MSG_NOTE_ON:
		printf("Note on                %2d, note %d, velocity %s, attr type = %d, data = 0x%x",
		       channel, m->note_off.note,
		       midi2_velocity(m->note_off.velocity),
		       m->note_off.attr_type, m->note_off.attr_data);
		break;

"note->on" is correct. This bug does not affect the display.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/285
Repository URL: https://github.com/alsa-project/alsa-utils
