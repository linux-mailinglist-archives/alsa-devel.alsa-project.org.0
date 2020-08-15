Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C62450B6
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Aug 2020 08:24:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C5BE166F;
	Sat, 15 Aug 2020 08:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C5BE166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597472644;
	bh=njS64JKamjsa+JUZefZvS253RY7i2/ZCR8UznDwKRg8=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bHqTK4Nm8N/KrMD77rH9IjryKTtm76BUVjzAGqI6VBfkNWiuv+xXsLHBJLLZb1XnG
	 QAjXVidFSepRVKS22MyVJOlDsipuf6V6WJKk7EupGGTv4t8JJE/Q+1/BlvtjlW+bPi
	 PQtIEI6IlzE6X54gTt+lElyFNY35rWRr97J4g3yM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA554F800D3;
	Sat, 15 Aug 2020 08:22:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5987BF8015B; Sat, 15 Aug 2020 08:22:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_19,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.cccmz.de (mail.cccmz.de [5.9.50.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E822F800D3
 for <alsa-devel@alsa-project.org>; Sat, 15 Aug 2020 08:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E822F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cccmz.de header.i=@cccmz.de
 header.b="MsTu8Mxp"
Received: from [192.168.178.45] (x4db54bca.dyn.telefonica.de [77.181.75.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: tanjeff@cccmz.de)
 by mail.cccmz.de (Postfix) with ESMTPSA id 9E28417A08DE
 for <alsa-devel@alsa-project.org>; Sat, 15 Aug 2020 08:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cccmz.de; s=2019;
 t=1597472531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=iWiz2B/Y36BU12cpVG8xr298kplLjTCsXz+hGApI8T0=;
 b=MsTu8Mxp2oeEDIWg9NociZs4n+iu5gJxQOjDGOPAcHDjpoqMRpzX+fOjS/4eKB2AkUjprw
 9M8+PgXAYWdFbu450Hz+ZDiN7KFhcp2jilB7JsqC0XR0ZLqdgk4JRIMKnoo1uMCHVDsFT+
 ZVhucO13gD6nfLQ1q3GN3aioXgXlu9M=
To: alsa-devel@alsa-project.org
From: Tanjeff Moos <tanjeff@cccmz.de>
Autocrypt: addr=tanjeff@cccmz.de; prefer-encrypt=mutual; keydata=
 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
 YAC/BUWuon8xl+Sm7fKHytJTyQ==
Subject: [PATCH] Add documentation for snd_ctl_elem_list_*
Message-ID: <29f40f92-c0ab-8191-48d9-5489af4954fb@cccmz.de>
Date: Sat, 15 Aug 2020 08:22:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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

I added doxygen documentation to alsa-lib. The patch was created using
git format-patch.

This is my first patch. Please let me know if I need to improve it.



From 731895b67fcae743551989a5dd04382003e66560 Mon Sep 17 00:00:00 2001
From: "Tanjeff-N. Moos" <tanjeff@cccmz.de>
Date: Fri, 14 Aug 2020 08:40:28 +0200
Subject: [PATCH] Add documentation for snd_ctl_elem_list_*.

---
 include/control.h     | 81 +++++++++++++++++++++++++++++++++++++++++--
 src/control/control.c | 80 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 148 insertions(+), 13 deletions(-)

diff --git a/include/control.h b/include/control.h
index 02db72d4..9deec6f3 100644
--- a/include/control.h
+++ b/include/control.h
@@ -56,7 +56,75 @@ typedef struct _snd_ctl_card_info snd_ctl_card_info_t;
 /** CTL element identifier container */
 typedef struct _snd_ctl_elem_id snd_ctl_elem_id_t;

-/** CTL element identifier list container */
+/** CTL element list container
+ *
+ * This is a list of CTL elements. The list contains management
+ * information (e.g. how many elements the sound card has) as well as
+ * the element identifiers. All functions which operate on the list
+ * are named snd_ctl_elem_list_*().
+ *
+ * \par Memory management
+ *
+ * There are two memory areas to deal with: The list container itself
+ * and the memory for the element identifiers.
+ *
+ * To manage the area for the list container, the following functions
+ * are used:
+ *
+ * - snd_ctl_elem_list_malloc() / snd_ctl_elem_list_free() to allocate
+ *   and free memory on the heap, or
+ * - snd_ctl_elem_list_alloca() to allocate the memory on the
+ *   stack. This memory is auto-released when the stack is unwound.
+ *
+ * To manage the space for the element identifiers, the
+ * snd_ctl_elem_list_alloc_space() and snd_ctl_elem_list_free_space()
+ * are used. Allocating the right amount of space can be achieved by
+ * first obtaining the number of elements and then calling
+ * snd_ctl_elem_list_alloc_space():
+ *
+ * \code
+ *   snd_ctl_elem_list_t* list;
+ *   int count;
+ *
+ *   // Initialise list
+ *   snd_ctl_elem_list_malloc(&list);
+ *
+ *   // Get number of elements
+ *   snd_ctl_elem_list(ctl, list);
+ *   count = snd_ctl_elem_list_get_count(list);
+ *
+ *   // Allocate space for identifiers
+ *   snd_ctl_elem_list_alloc_space(list, count);
+ *
+ *   // Get identifiers
+ *   snd_ctl_elem_list(ctl, list); // yes, this is same as above :)
+ *
+ *   // Do something useful with the list...
+ *
+ *   // Cleanup
+ *   snd_ctl_elem_list_free_space(list);
+ *   snd_ctl_elem_list_free(list);
+ * \endcode
+ *
+ *
+ * \par The Elements
+ *
+ * The elements in the list are accessed using an index. This index is
+ * the location in the list; Don't confuse it with the 'index' of the
+ * element identifier. For example:
+ *
+ * \code
+ *     snd_ctl_elem_list_t list;
+ *     unsigned int element_index;
+ *
+ *     // Allocate space, fill list ...
+ *
+ *     element_index = snd_ctl_elem_list_get_index(&list, 2);
+ * \endcode
+ *
+ * This will access the 3rd element in the list (index=2) and get the
+ * elements index from the driver (which might be 13, for example).
+ */
 typedef struct _snd_ctl_elem_list snd_ctl_elem_list_t;

 /** CTL element info container */
@@ -354,11 +422,18 @@ void snd_ctl_event_copy(snd_ctl_event_t *dst,
const snd_ctl_event_t *src);
 snd_ctl_event_type_t snd_ctl_event_get_type(const snd_ctl_event_t *obj);

 size_t snd_ctl_elem_list_sizeof(void);
+
 /** \hideinitializer
- * \brief allocate an invalid #snd_ctl_elem_list_t using standard alloca
- * \param ptr returned pointer
+ *
+ * \brief Allocate a #snd_ctl_elem_list_t using standard alloca.
+ *
+ * The memory is allocated on the stack and will automatically be
+ * released when the stack unwinds (i.e. no free() is needed).
+ *
+ * \param ptr Pointer to allocated memory.
  */
 #define snd_ctl_elem_list_alloca(ptr) __snd_alloca(ptr, snd_ctl_elem_list)
+
 int snd_ctl_elem_list_malloc(snd_ctl_elem_list_t **ptr);
 void snd_ctl_elem_list_free(snd_ctl_elem_list_t *obj);
 void snd_ctl_elem_list_clear(snd_ctl_elem_list_t *obj);
diff --git a/src/control/control.c b/src/control/control.c
index e21e8f1d..1bcf1ab2 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -280,6 +280,21 @@ int snd_ctl_card_info(snd_ctl_t *ctl,
snd_ctl_card_info_t *info)

 /**
  * \brief Get a list of element identifiers
+ *
+ * Before calling this function, memoru must be allocated using
+ * snd_ctl_elem_list_malloc().
+ *
+ * This function obtains data from the sound card driver and puts it
+ * into the list.
+ *
+ * If there was space allocated for the element identifiers (using
+ * snd_ctl_elem_list_alloc_space()), information will be filled in. If
+ * too little space was allocated, only a part of the elements will be
+ * queried. If there was too much space allocated, some of it remains
+ * unused. Use snd_ctl_elem_list_get_count() and
+ * snd_ctl_elem_list_get_used() to obtain information about space
+ * usage. See #snd_ctl_elem_list_t to learn more.
+ *
  * \param ctl CTL handle
  * \param list CTL element identifiers list pointer
  * \return 0 on success otherwise a negative error code
@@ -1508,9 +1523,14 @@ const char
*snd_ctl_event_type_name(snd_ctl_event_type_t type)

 /**
  * \brief allocate space for CTL element identifiers list
- * \param obj CTL element identifiers list
- * \param entries Entries to allocate
- * \return 0 on success otherwise a negative error code
+ *
+ * The space can be released with snd_ctl_elem_list_free_space().
+ *
+ * \param obj CTL element identifiers list.
+ * \param entries How many entries to allocate. See
+ *        #snd_ctl_elem_list_t to learn how to obtain
+ *        this number in advance.
+ * \return 0 on success otherwise a negative error code.
  */
 int snd_ctl_elem_list_alloc_space(snd_ctl_elem_list_t *obj, unsigned
int entries)
 {
@@ -1526,6 +1546,10 @@ int
snd_ctl_elem_list_alloc_space(snd_ctl_elem_list_t *obj, unsigned int entries

 /**
  * \brief free previously allocated space for CTL element identifiers list
+ *
+ * Releases space previously allocated using
+ * snd_ctl_elem_list_alloc_space().
+ *
  * \param obj CTL element identifiers list
  */
 void snd_ctl_elem_list_free_space(snd_ctl_elem_list_t *obj)
@@ -2016,7 +2040,7 @@ snd_ctl_event_type_t snd_ctl_event_get_type(const
snd_ctl_event_t *obj)
 }

 /**
- * \brief get size of #snd_ctl_elem_list_t
+ * \brief get size of #snd_ctl_elem_list_t.
  * \return size in bytes
  */
 size_t snd_ctl_elem_list_sizeof()
@@ -2025,7 +2049,10 @@ size_t snd_ctl_elem_list_sizeof()
 }

 /**
- * \brief allocate an invalid #snd_ctl_elem_list_t using standard malloc
+ * \brief allocate a #snd_ctl_elem_list_t using standard malloc.
+ *
+ * The memory can be released using snd_ctl_elem_list_free().
+ *
  * \param ptr returned pointer
  * \return 0 on success otherwise negative error code
  */
@@ -2039,7 +2066,15 @@ int snd_ctl_elem_list_malloc(snd_ctl_elem_list_t
**ptr)
 }

 /**
- * \brief frees a previously allocated #snd_ctl_elem_list_t
+ * \brief frees a previously allocated #snd_ctl_elem_list_t.
+ *
+ * Release memory previously allocated using
+ * snd_ctl_elem_list_malloc().
+ *
+ * If you used snd_ctl_elem_list_alloc_space() on the list, you must
+ * use snd_ctl_elem_list_free_space() \em before calling this
+ * function.
+ *
  * \param obj pointer to object to free
  */
 void snd_ctl_elem_list_free(snd_ctl_elem_list_t *obj)
@@ -2048,7 +2083,15 @@ void snd_ctl_elem_list_free(snd_ctl_elem_list_t *obj)
 }

 /**
- * \brief clear given #snd_ctl_elem_list_t object
+ * \brief Clear given #snd_ctl_elem_list_t object.
+ *
+ * This will make the stored identifiers inaccessible without freeing
+ * their space.
+ *
+ * \warning The element identifier space cannot be freed after calling
+ *          this function. Therefore, snd_ctl_elem_list_free_space()
+ *          must be called in advance.
+ *
  * \param obj pointer to object to clear
  */
 void snd_ctl_elem_list_clear(snd_ctl_elem_list_t *obj)
@@ -2057,7 +2100,11 @@ void snd_ctl_elem_list_clear(snd_ctl_elem_list_t
*obj)
 }

 /**
- * \brief copy one #snd_ctl_elem_list_t to another
+ * \brief copy one #snd_ctl_elem_list_t to another.
+ *
+ * This performs a shallow copy. That means the both lists will share
+ * the same space for the elements.  The elements will not be copied.
+ *
  * \param dst pointer to destination
  * \param src pointer to source
  */
@@ -2080,6 +2127,12 @@ void
snd_ctl_elem_list_set_offset(snd_ctl_elem_list_t *obj, unsigned int val)

 /**
  * \brief Get number of used entries in CTL element identifiers list
+ *
+ * This function returns how many entries are actually filled with
+ * useful information.
+ *
+ * See also snd_ctl_elem_list_get_count().
+ *
  * \param obj CTL element identifier list
  * \return number of used entries
  */
@@ -2090,7 +2143,14 @@ unsigned int snd_ctl_elem_list_get_used(const
snd_ctl_elem_list_t *obj)
 }

 /**
- * \brief Get total count of elements present in CTL device
(information present in every filled CTL element identifiers list)
+ * \brief Get total count of elements present in CTL device
+ *
+ * This function returns how many entries were allocated using
+ * snd_ctl_elem_list_alloc_space(). This information is present after
+ * snd_ctl_elem_list() was called.
+ *
+ * See also snd_ctl_elem_list_get_used().
+ *
  * \param obj CTL element identifier list
  * \return total number of elements
  */
@@ -2140,7 +2200,7 @@ snd_ctl_elem_iface_t
snd_ctl_elem_list_get_interface(const snd_ctl_elem_list_t *
 }

 /**
- * \brief Get device part of CTL element identifier for an entry of a
CTL element identifiers list
+ * \brief Get the device part of CTL element identifier for an entry of
a CTL element identifiers list
  * \param obj CTL element identifier list
  * \param idx Index of entry
  * \return CTL element related device
-- 
2.17.1

